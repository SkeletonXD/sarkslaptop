{pkgs, modulesPath, ...}:

{

  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  
  hardware = {
    enableAllFirmware = true;
    enableAllHardware = true;
        
    bluetooth.enable = true;

    cpu.intel = {
      npu.enable = true;
      updateMicrocode = true;
    };

    graphics = {
      enable = true; enable32Bit = true;
      extraPackages = with pkgs; [ intel-media-driver intel-compute-runtime vpl-gpu-rt];
      extraPackages32 = with pkgs.pkgsi686Linux; [ intel-media-driver ];
    };

  };

  services = {
    fwupd.enable = true;
    fstrim.enable = true;
    libinput.enable = true;
    thermald.enable = true;
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      pd.enable = true;
    };
    
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = { enable = true; support32Bit = true; };
    };

    usbguard = {
      enable = true; IPCAllowedGroups =[ "wheel" ];
      rules = ''
      allow id 1d6b:0002 serial "0000:00:0d.0" name "xHCI Host Controller" with-interface 09:00:00 with-connect-type ""
      allow id 1d6b:0003 serial "0000:00:0d.0" name "xHCI Host Controller" with-interface 09:00:00 with-connect-type ""
      allow id 1d6b:0002 serial "0000:00:14.0" name "xHCI Host Controller" with-interface 09:00:00 with-connect-type ""
      allow id 1d6b:0003 serial "0000:00:14.0" name "xHCI Host Controller" with-interface 09:00:00 with-connect-type ""

      allow id 5858:1004 serial "0001" name "HD Camera" with-interface { 0e:01:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 0e:02:00 } with-connect-type "hardwired"
      allow id 8087:0026 serial "" name "" via-port "3-10" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 } with-connect-type "not used"

      # PRINTER
      allow id 03f0:3d17 serial "BB0AEH3" name "HP LaserJet P1005" hash "BzdrxqyA89ENiiCQrTMWNAOpZVu+3Jgfg0IqbiD+sCU=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" with-interface 07:01:02 with-connect-type "hotplug"
      # SCANNER
      allow id 04b8:012d serial "" name "EPSON Scanner" hash "iOzdJCRdRdI/8k7zir/bhcXmOjvacde47PgSGmxQi28=" parent-hash "jEP/6WzviqdJ5VSeTUY8PatCNBKeaREvo2OqdplND/o=" with-interface ff:ff:ff with-connect-type "hotplug"
      '';
    };
  };

  systemd.user.services.usbguard-notifier = {
    description = "USBGuard GNOME Notifier";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.usbguard-notifier}/bin/usbguard-notifier";
      Restart = "on-failure";
      RestartSec = "3s";
    };
  };
}

{pkgs, ...}:

{
  boot = {
    
    loader = {
      
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      
      limine = {
        enable = true;
        resolution = "2880x1800";
        secureBoot.enable = true;
        maxGenerations = 3;
        extraEntries = ''
          /Windows
          protocol: uefi
          path: boot():///EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
      
    };
    
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ pkgs.mac-style-plymouth ];
    };

    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelModules = [ "kvm-intel" "ntsync" ];
    kernelParams = [ "i915.force_probe=!7d55" "xe.force_probe=7d55" "quiet" ]; 

    initrd = {
      compressor = "zstd";
      compressorArgs = [ "-19" "-T0" ];
      availableKernelModules = [ "xhci_pci" "nvme" "uas" "sd_mod" ];      
      kernelModules = [ "xe" ];
    };
    
  };
  
}

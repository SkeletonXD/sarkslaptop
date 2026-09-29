{...}:

{
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "sarkslaptop";
    nftables.enable = true;
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    wg-quick.interfaces = {
       zhurman.configFile = "/boot/nixconff/Zhurman.conf";
    };
    networkmanager.unmanaged = [
       "interface-name:zhurman"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 7777  ];
      allowedUDPPorts = [ 51822 47584 ];
    };
  };

  programs.mtr.enable = true;
}

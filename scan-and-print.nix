{pkgs, ...}:

{
  
  hardware.sane = {
      enable = true;
      extraBackends = [ pkgs.epkowa ];
  };

  services = {
    udev.packages = [ pkgs.hplipWithPlugin ];  
    avahi = {enable = true; nssmdns4 = true; openFirewall = true;};
    printing = { enable = true; drivers = [ pkgs.hplipWithPlugin]; };
  };

  environment.systemPackages = [pkgs.kdePackages.skanpage];
  
}

{pkgs, ...}:

{
  services = {
    udisks2.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs = {
    xwayland.enable = true;
    dconf = {
      enable = true;
      profiles.user.databases = [{
        settings = {
          "org/gnome/desktop/privacy".usb-protection-level = "always";
        };
      }];
    };
  };

  environment.systemPackages = with pkgs.gnomeExtensions;  [
    pkgs.gnome-tweaks pkgs.endeavour pkgs.geary
    
    appindicator blur-my-shell burn-my-windows emoji-copy
    touchpad-gesture-customization media-controller runcat
    wack-sonoma-lockscreen gamemode-shell-extension
  ];

  
  environment.gnome.excludePackages = with pkgs; [   
    epiphany evince gnome-contacts gnome-weather gnome-maps
    gnome-software gnome-tour
  ];

}

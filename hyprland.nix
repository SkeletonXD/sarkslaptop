{pkgs, ...}:
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    hyprlock.enable = true;
  };

  environment.systemPackages = [ pkgs.noctalia ];
}

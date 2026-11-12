{pkgs, ...}:
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [ noctalia xrdb ];
}

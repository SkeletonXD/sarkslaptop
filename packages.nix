{pkgs, inputs, ...}:

{

  services = {
    
    murmur = { enable = true; password = "youareanidiot"; openFirewall = true; };
    
    flatpak = {
      enable = true;
      uninstallUnmanaged = true;
      update.onActivation = true;
      packages = [
        "com.usebottles.bottles" "com.vysp3r.ProtonPlus" "org.vinegarhq.Sober"
      ];
    };
    
  };

  
  programs = {
    nix-ld.enable = true;
    fish = { enable = true; interactiveShellInit = ''set -g fish_greeting ""''; };
    throne = { enable = true; tunMode = { setuid = true; enable = true; }; };
    localsend = {enable = true;openFirewall = true;};
    firejail.enable = true;
    gamemode.enable = true;
    steam.enable = true;
  };
  
  
  environment.systemPackages = with pkgs; [
    # cli
    helix nixd nil git zellij ffmpeg-headless
    wl-clipboard btop

    # GUI
    obsidian ayugram-desktop onlyoffice-desktopeditors discord mumble audacity
    inputs.pinecone-mc.packages."${stdenv.hostPlatform.system}".default
    
    # browser
    (inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default.override {
      extraPolicies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
      };
    })
  ];
}

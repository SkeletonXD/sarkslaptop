{pkgs, inputs, ...}:

{

  services = {
    
    murmur = { enable = true; password = "youareanidiot"; openFirewall = true; };


    taskchampion-sync-server = { enable = true;
      host = "0.0.0.0"; port = 10222; openFirewall = true;
      allowClientIds = ["cac09809-88c0-4f5b-9c7f-d59699ff3fa5"];
    };
    
    
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
    wl-clipboard btop antimicrox fastfetch-unwrapped
    aircrack-ng mdk4 macchanger
    taskwarrior3

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

    # JETBRAINSS
    jetbrains.clion jetbrains.pycharm jetbrains.rust-rover
  ];
}

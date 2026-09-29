{ pkgs, ... }:

{ 
  nixpkgs.config.allowUnfree = true;
  
  nix = {
    package = pkgs.lix;
    settings = {
      http3 = true;
      http-connections = 50;
      max-substitution-jobs = 20;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  
  systemd.services = {
    nix-daemon.environment = {
      https_proxy = "socks5h://127.0.0.1:2080"; 
      http_proxy = "socks5h://127.0.0.1:2080";
    };
  };

  
  home-manager = {useGlobalPkgs = true;useUserPackages = true;};
  system.stateVersion = "26.11"; # Did you read the comment? Nah man.
}

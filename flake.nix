{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    pinecone-mc = {
      url = "github:ElyPrismLauncher/Launcher";
      inputs.nixpkgs.follows =  "nixpkgs";
    };
    mac-style-plymouth = {
      url = "github:SergioRibera/s4rchiso-plymouth-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };
  outputs = { self,nixpkgs,home-manager,nix-flatpak,impermanence,mac-style-plymouth,... }: {
    nixosConfigurations.sarkslaptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inputs = self.inputs; }; 
      modules = [
        impermanence.nixosModules.impermanence
        home-manager.nixosModules.home-manager
        nix-flatpak.nixosModules.nix-flatpak
        {nixpkgs.overlays = [
          mac-style-plymouth.overlays.default
        ];}
        
        ./nix-settings.nix ./persistence.nix
        ./boot.nix ./filesystems.nix ./hardware.nix
        ./virtualisation.nix ./network.nix ./locale.nix

        ./gnome.nix ./packages.nix ./sark.nix

        ./scan-and-print.nix
        
       ];
    };
  };
}

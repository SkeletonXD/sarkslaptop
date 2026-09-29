{pkgs, ...}:
{
  users.users.sark = {
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPassword = "$6$e/XlkLrKo468vz0f$PoU5r12LQ7G72Q.iAs6IpHVGqpyHSbTPUVoamrdvD1Mp9ifmMEnUo9MTXF0C8Gx5TE3/uIN2PrIy6UlnR/afu1";
    extraGroups = [
      "wheel" "audio" "lp" "video" "scanner" "libvirtd" "input" "kvm" "render"
    ];
  };

  home-manager.users.sark = {...}: {    
    programs = {
      helix = {
        enable = true;
        defaultEditor = true;
        extraConfig = "theme=\"zed_onedark\"";
      };
    };
    home.stateVersion = "26.11";
  };
}

{...}:

{  
  fileSystems."/" = 
    { device = "none";
      fsType = "tmpfs";
      options = [ "size=50%" "mode=755" ];
    };

  boot.initrd.luks.devices."enc-root" = 
    { device = "/dev/disk/by-uuid/8f3d2971-cee5-4cd1-9778-f0796c69723a";
      allowDiscards = true;
      crypttabExtraOpts = [ "tpm2-device=auto" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/enc-root";
      fsType = "btrfs";
      options = [ "subvol=@nix" "noatime" "compress=zstd:1" ];
    };

  fileSystems."/home" =
    { device = "/dev/mapper/enc-root";
      fsType = "btrfs";
      options = [ "subvol=@home" "noatime" "compress=zstd:1" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/C73E-9CD7";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
}

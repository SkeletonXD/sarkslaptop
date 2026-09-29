{pkgs, ...}:

{
  virtualisation = {
    
    waydroid.enable = true;

    spiceUSBRedirection.enable = true;
    
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
    
  };
  
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;

}

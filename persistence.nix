{...}:

{
  
  environment.persistence."/nix/persistent" = {
    hideMounts = true;
    directories = [
      "/var"
      "/etc/NetworkManager"
      "/etc/ssh"
      "/etc/secureboot"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}

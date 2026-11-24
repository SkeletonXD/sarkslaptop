{pkgs, ...}:

{
  environment.systemPackages = [ pkgs.wineWow64Packages.stagingFull ];
  boot.binfmt.registrations.windows = {
    recognitionType = "magic";
    offset=0;
    magicOrExtension = "MZ";
    interpreter = "${pkgs.wineWow64Packages.stagingFull}/bin/wine";
  };
}

{...}:

{  
  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Europe/Moscow";
  };
  
  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    extraLocaleSettings = { LC_TIME = "en_US.UTF-8"; };
  };

  services.xserver.xkb = { layout = "us,ru"; options = "grp:win_space_toggle"; };
  console.useXkbConfig = true;
}

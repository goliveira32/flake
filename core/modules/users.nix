{ settings, ... }: {

  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services.getty.autologinUser = settings.username;

}

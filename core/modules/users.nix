{ meta, ... }:

{
  users.users.${meta.system.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services.getty.autologinUser = meta.system.username;
}

{ meta, ... }:

{
  users.users.${meta.system.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    description = meta.general.name;
  };

  services.getty.autologinUser = meta.system.username;
}

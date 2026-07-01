{ meta, ... }:

{
  users.users.${meta.system.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
    ];
    description = meta.general.name;
  };

  services.getty.autologinUser = meta.system.username;
}

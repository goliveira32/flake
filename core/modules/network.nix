{ settings, ... }:
{

  networking.hostName = settings.hostname;
  networking.wireless.iwd.enable = true;

}

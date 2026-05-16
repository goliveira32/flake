{ settings, ... }:
{

  networking = {
    hostName = settings.hostname;
    wireless.iwd.enable = true;
    nameservers = [ "194.242.2.2#dns.mullvad.net" ];
  };

  services.resolved = {
    enable = true;
    dnsovertls = "true";
    domains = [ "~." ];
  };

}

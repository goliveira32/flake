{ meta, ... }:

{
  networking = {
    hostName = meta.system.hostname;
    wireless.iwd.enable = true;
    nameservers = [ "194.242.2.2#dns.mullvad.net" ];
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSOverTLS = true;
      Domains = [ "~." ];
    };
  };
}

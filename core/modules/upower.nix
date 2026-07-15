{ ... }:

{
  services.upower = {
    enable = true;
    allowRiskyCriticalPowerAction = true;
    criticalPowerAction = "PowerOff";
  };
}

{ meta, ... }:

{
  time.timeZone = meta.system.timezone;
  i18n.defaultLocale = meta.system.locale;
  console.keyMap = meta.system.keymap;
}

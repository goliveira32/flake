{ meta, ... }:

{
  dconf.settings."org/gnome/desktop/interface".color-scheme =
    if meta.theme.flavor == "latte" then "prefer-light" else "prefer-dark";
}

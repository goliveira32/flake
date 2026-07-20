{
  lib,
  pkgs,
  meta,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    settings =
      let
        modifiers = {
          primary = "SUPER";
          secondary = "ALT";
          auxiliary = "CTRL";
        };
        terminal = "${pkgs.alacritty}/bin/alacritty";
        browser = "${pkgs.firefox}/bin/firefox";
        menu = "${pkgs.procps}/bin/pkill rofi || ${pkgs.rofi}/bin/rofi -show drun";
        lock = "${pkgs.hyprlock}/bin/hyprlock";
      in
      {
        config = {
          general = {
            gaps_in = 2;
            gaps_out = 4;
            border_size = 2;
            col = {
              active_border = lib.generators.mkLuaInline "colors.accent";
              inactive_border = lib.generators.mkLuaInline "\"rgba(\" .. colors.baseAlpha .. \"aa)\"";
            };
            resize_on_border = true;
          };
          decoration = {
            rounding = 12;
            rounding_power = 4.0;
            blur.size = 3;
          };
          dwindle.preserve_split = true;
          input = {
            kb_layout = meta.system.keymap.graphical;
            sensitivity = 0.7;
            touchpad.natural_scroll = true;
          };
        };
        bind = [
          {
            _args = [
              "${modifiers.primary} + RETURN"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${terminal}\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + B"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${browser}\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + SUPER_L"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${menu}\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + L"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lock}\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + ESCAPE"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.hyprshutdown}/bin/hyprshutdown\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + Q"
              (lib.generators.mkLuaInline "hl.dsp.window.close()")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + F"
              (lib.generators.mkLuaInline "hl.dsp.window.float({ action = \"toggle\" })")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + R"
              (lib.generators.mkLuaInline "hl.dsp.submap(\"resize\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + P"
              (lib.generators.mkLuaInline "hl.dsp.window.pseudo()")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + J"
              (lib.generators.mkLuaInline "hl.dsp.layout(\"togglesplit\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + PRINT"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard-rs}/bin/wl-copy\")")
            ];
          }
          {
            _args = [
              "PRINT"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.grim}/bin/grim -g \\\"$(${pkgs.slurp}/bin/slurp -w 0)\\\" - | ${pkgs.wl-clipboard-rs}/bin/wl-copy\")")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + mouse:272"
              (lib.generators.mkLuaInline "hl.dsp.window.drag()")
              { mouse = true; }
            ];
          }
          {
            _args = [
              "${modifiers.primary} + mouse:273"
              (lib.generators.mkLuaInline "hl.dsp.window.resize()")
              { mouse = true; }
            ];
          }
          {
            _args = [
              "XF86AudioRaiseVolume"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+\")")
              {
                locked = true;
                repeating = true;
              }
            ];
          }
          {
            _args = [
              "XF86AudioLowerVolume"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")")
              {
                locked = true;
                repeating = true;
              }
            ];
          }
          {
            _args = [
              "XF86AudioMute"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")")
              { locked = true; }
            ];
          }
          {
            _args = [
              "XF86AudioMicMute"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")")
              { locked = true; }
            ];
          }
          {
            _args = [
              "XF86MonBrightnessUp"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%+\")")
              {
                locked = true;
                repeating = true;
              }
            ];
          }
          {
            _args = [
              "XF86MonBrightnessDown"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%-\")")
              {
                locked = true;
                repeating = true;
              }
            ];
          }
          {
            _args = [
              "${modifiers.primary} + LEFT"
              (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"e-1\" })")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + RIGHT"
              (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"e+1\" })")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + mouse_up"
              (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"e-1\" })")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + mouse_down"
              (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"e+1\" })")
            ];
          }

          # TODO: Limit available workspaces.
          {
            _args = [
              "${modifiers.primary} + ${modifiers.auxiliary} + LEFT"
              (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = \"-1\" })")
            ];
          }
          {
            _args = [
              "${modifiers.primary} + ${modifiers.auxiliary} + RIGHT"
              (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = \"+1\" })")
            ];
          }
        ]
        ++ lib.flatten (
          map
            (dir: [
              {
                _args = [
                  "${modifiers.secondary} + ${lib.toUpper dir}"
                  (lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"${dir}\" })")
                ];
              }
              {
                _args = [
                  "${modifiers.secondary} + ${modifiers.auxiliary} + ${lib.toUpper dir}"
                  (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = \"${dir}\" })")
                ];
              }
            ])
            [
              "left"
              "right"
              "up"
              "down"
            ]
          ++ map (num: [
            {
              _args = [
                "${modifiers.primary} + ${toString (lib.mod num 10)}"
                (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${toString num} })")
              ];
            }
            {
              _args = [
                "${modifiers.primary} + ${modifiers.auxiliary} + ${toString (lib.mod num 10)}"
                (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString num} })")
              ];
            }
          ]) (lib.range 1 10)
        );
        define_submap = {
          _args = [
            "resize"
            (lib.generators.mkLuaInline ''
              function()
                hl.bind("LEFT", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
                hl.bind("RIGHT", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
                hl.bind("UP", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })
                hl.bind("DOWN", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })
                hl.bind("ESCAPE", hl.dsp.submap("reset"))
              end
            '')
          ];
        };
        layer_rule = {
          match.namespace = "rofi";
          blur = true;
          ignore_alpha = 0;
        };
        window_rule = [
          # Ignore maximize requests from apps.
          {
            match.class = ".*";
            suppress_event = "maximize";
          }

          # Fix some dragging issues with XWayland.
          {
            match = {
              class = "^$";
              title = "^$";
              xwayland = true;
              float = true;
              fullscreen = false;
              pin = false;
            };
            no_focus = true;
          }
        ];
        curve = [
          {
            _args = [
              "easeOutQuint"
              {
                type = "bezier";
                points = [
                  [
                    0.23
                    1
                  ]
                  [
                    0.32
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "easeInOutCubic"
              {
                type = "bezier";
                points = [
                  [
                    0.65
                    0.05
                  ]
                  [
                    0.36
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "linear"
              {
                type = "bezier";
                points = [
                  [
                    0
                    0
                  ]
                  [
                    1
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "almostLinear"
              {
                type = "bezier";
                points = [
                  [
                    0.5
                    0.5
                  ]
                  [
                    0.75
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "quick"
              {
                type = "bezier";
                points = [
                  [
                    0.15
                    0
                  ]
                  [
                    0.1
                    1
                  ]
                ];
              }
            ];
          }
          {
            _args = [
              "easy"
              {
                type = "spring";
                mass = 1;
                stiffness = 71.2633;
                dampening = 15.8273644;
              }
            ];
          }
        ];
        animation = [
          {
            leaf = "global";
            enabled = true;
            speed = 10;
            bezier = "default";
          }
          {
            leaf = "windows";
            enabled = true;
            speed = 4.79;
            spring = "easy";
          }
          {
            leaf = "windowsIn";
            enabled = true;
            speed = 4.1;
            spring = "easy";
            style = "popin 87%";
          }
          {
            leaf = "windowsOut";
            enabled = true;
            speed = 1.49;
            bezier = "linear";
            style = "popin 87%";
          }
          {
            leaf = "layers";
            enabled = true;
            speed = 3.81;
            bezier = "easeOutQuint";
          }
          {
            leaf = "layersIn";
            enabled = true;
            speed = 4;
            bezier = "easeOutQuint";
            style = "fade";
          }
          {
            leaf = "layersOut";
            enabled = true;
            speed = 1.5;
            bezier = "linear";
            style = "fade";
          }
          {
            leaf = "fade";
            enabled = true;
            speed = 3.03;
            bezier = "quick";
          }
          {
            leaf = "fadeIn";
            enabled = true;
            speed = 1.73;
            bezier = "almostLinear";
          }
          {
            leaf = "fadeOut";
            enabled = true;
            speed = 1.46;
            bezier = "almostLinear";
          }
          {
            leaf = "fadeLayersIn";
            enabled = true;
            speed = 1.79;
            bezier = "almostLinear";
          }
          {
            leaf = "fadeLayersOut";
            enabled = true;
            speed = 1.39;
            bezier = "almostLinear";
          }
          {
            leaf = "border";
            enabled = true;
            speed = 5.39;
            bezier = "easeOutQuint";
          }
          {
            leaf = "workspaces";
            enabled = true;
            speed = 2.5;
            bezier = "easeOutQuint";
            style = "slide";
          }
          {
            leaf = "workspacesIn";
            enabled = true;
            speed = 2.75;
            bezier = "easeOutQuint";
            style = "slide";
          }
          {
            leaf = "workspacesOut";
            enabled = true;
            speed = 2.5;
            bezier = "easeOutQuint";
            style = "slide";
          }
          {
            leaf = "zoomFactor";
            enabled = true;
            speed = 7;
            bezier = "quick";
          }
        ];
      };
  };
}

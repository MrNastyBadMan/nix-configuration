{
  config,
  pkgs,
  lib,
  ...
}:
let
  base00 = config.colorScheme.palette.base00;
  base01 = config.colorScheme.palette.base01;
  base02 = config.colorScheme.palette.base02;
  base03 = config.colorScheme.palette.base03;
  base04 = config.colorScheme.palette.base04;
  base05 = config.colorScheme.palette.base05;
  base06 = config.colorScheme.palette.base06;
  base07 = config.colorScheme.palette.base07;
  base08 = config.colorScheme.palette.base08;
  base09 = config.colorScheme.palette.base09;
  base0A = config.colorScheme.palette.base0A;
  base0B = config.colorScheme.palette.base0B;
  base0C = config.colorScheme.palette.base0C;
  base0D = config.colorScheme.palette.base0D;
  base0E = config.colorScheme.palette.base0E;
  base0F = config.colorScheme.palette.base0F;
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        margin = "4";

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "power-profiles-daemon"
          "backlight"
          "pulseaudio"
          "network"
          #"custom/power"
        ];

        "custom/nix" = {
          "format" = "";
        };

        "clock" = {
          "format" = "{:%I:%M %p - %a, %d, %b, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = "{usage}%  ";
          "max-length" = 10;
          "interval" = 5;
        };

        "memory" = {
          format = "{percentage}%  ";
          max-length = 8;
          interval = 5;
        };

        "temperature" = {
          "critical-threshold" = 80;
          format = "{temperatureC}°C ";
          max-length = 6;
        };

        "backlight" = {
          format = "{percent}% {icon}";
          "format-icons" = [
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
          ];
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          interval = 10;
          format = "{capacity}% {icon}";
          "format-full" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-icons" = [
            " "
            " "
            " "
            " "
            " "
          ];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          "format-icons" = {
            default = " ";
            performance = " ";
            balanced = " ";
            "power-saver" = " ";
          };
        };

        "network" = {
          "format-wifi" = "{signalStrength}%  ";
          "format-ethernet" = "{ipaddr}/{cidr}  ";
          "tooltip-format" = "Connected to {essid}";
          "format-linked" = "{ifname} (No IP)  ";
          "format-disconnected" = "Disconnected ⚠";
          # "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon} ";
          "format-bluetooth" = "{volume}% {icon} ";
          "format-bluetooth-muted" = " {icon} ";
          "format-muted" = "{volume}%  ";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
        };

        "custom/power" = {
          format = "⏻";
          tooltip = false;
          menu = "on-click";
          "menu-file" = "$HOME/.config/waybar/power_menu.xml";
          "menu-actions" = {
            "shutdown" = "shutdown";
            "reboot" = "reboot";
            "suspend" = "systemctl suspend";
            "hibernate" = "systemctl hibernate";
          };
        };

        "hyprland/workspaces" = {
          format = "{name}";
          move-to-monitor = true;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          min-height: 0;
          font-family: FontAwsome, JetBrainsMono;
          font-weight: 500;
          font-size: 14px;
          padding: 0;
      }

      window#waybar {
          background: #${base00};
          border: 2px solid #${base01};
      }

      tooltip {
          background-color: #${base00};
          border: 2px solid #${base01};
      }

      #clock,
      #tray,
      #cpu,
      #memory,
      #battery,
      #network,
      #pulseaudio,
      #temperature,
      #power-profiles-daemon,
      #backlight {
          margin: 6px 6px 6px 0px;
          padding: 2px 8px;
          background-color: #${base06};
          border: 2px solid #${base04};
          color: #${base01};
      }

      #workspaces {
          background-color: #${base01};
          margin: 6px 0px 6px 6px;
          border: 2px solid #${base02};
      }

      #workspaces button {
          all: initial;
          min-width: 0;
          box-shadow: inset 0 -3px transparent;
          padding: 2px 4px;
          color: #${base06};
      }

      #workspaces button.active {
          color: #${base01};
          background-color: #${base0B};
      }

      #workspaces button.urgent {
          background-color: #${base09};
          color: #${base01};
      }

      #clock {
          background-color: #${base01};
          border: 2px solid #${base02};
          color: #${base06};
      }
          
      #cpu.critical,
      #memory.critical {
          background-color: #${base08};
          color: #${base00};
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
          background-color: #${base09};
          color: #${base00};
      }
    '';
  };
}

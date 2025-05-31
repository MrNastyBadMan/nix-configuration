{config, pkgs, lib, ... }:

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
        margin = "10";

        modules-left = [
          "custom/nix"
          "memory"
          "cpu"
          "temperature"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "power-profiles-daemon"
          "backlight"
          "pulseaudio"
          "battery"
          "clock"
          "network"
          "tray"
          "custom/power"
        ];

        "custom/nix" = {
          "format" = "";
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };

        "cpu" = {
          format = "cpu: {}%";
          "max-length" = 10;
          "interval" = 10;
        };

        "memory" = {
          format = "mem: {}%";
          interval = 10;
        };

        "temperature" = {
          "critical-threshold" = 80;
          format = " {temperatureC}°C";
        };

        "backlight" = {
          format = "{percent}% {icon}";
          "format-icons" = [" " " " " " " " " " " " " " " " " "];
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
          "format-alt" = "{time} {icon}";
          "format-icons" = [" " " " " " " " " "];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          "format-icons" = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };

        "network" = {
          "format-wifi" = "{essid} ({signalStrength}%)  ";
          "format-ethernet" = "{ipaddr}/{cidr}  ";
          "tooltip-format" = "{ifname} via {gwaddr}  ";
          "format-linked" = "{ifname} (No IP)  ";
          "format-disconnected" = "Disconnected ⚠";
         # "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon}  {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = "󰝟 {icon} {format_source}";
          "format-muted" = "󰝟 {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = ["" "" ""];
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
          format = "";
          "persistent-workspaces" = { "*" = 5; };
        };
      };
    };

   # style = ''
   #   * {
   #     font-family: FontAwsome, JetBrainsMono;
   #     min-height: 0;
   #   }

   #   window#waybar {
   #     background-color: rgba(43,48,59,0.5);
   #     color: #ffffff;
   #   }

   #   #workspaces {
   #     font-size: 0px;
   #     border: 5px solid #${base05};
   #     border-radius: 23px;
   #   }

   #   #workspaces button {
   #     margin: 3px;
   #     background-color: #${base02};
   #     border-radius: 10px;
   #   }

   #   #workspaces button.active {
   #     background-color: #${base03};
   #   }
   # '';
  };
}

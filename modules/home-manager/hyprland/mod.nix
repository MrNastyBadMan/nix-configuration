{ config, pkgs, lib, ... }:

  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.swww}/bin/swww-daemon &
      sleep 1
      ${pkgs.swww}/bin/swww img ./wallpaper2.jpg &

      ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &
      ${pkgs.waybar}/bin/waybar &
      ${pkgs.dunst}/bin/dunst
    '';
    launchWaybar = pkgs.pkgs.writeShellScriptBin "launch-waybar" ''
      killall .waybar-wrapped
      waybar &
    '';
  in
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
      exec-once = ''${startupScript}/bin/start'';

      # Monitors and Workspaces
      monitor = [
        "eDP-1,preferred,auto,1"
        "DP-3, 2560x1440@120, auto, 1"
      ];
      
      "$terminal" = "kitty";
      # environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      general = {
        "gaps_in" = "2";
        "gaps_out" = "4";
        "border_size" = "2";
        "col.active_border" = "rgb(${config.colorScheme.palette.base07}) 45deg";
        "col.inactive_border" = "rgba(${config.colorScheme.palette.base01}aa)";
        "resize_on_border" = "false";
        "allow_tearing" = "true";
        "layout" = "dwindle";
      };
      decoration = {
        "rounding" = "10";
        "rounding_power" = "10";
        "active_opacity" = "1.0";
        "inactive_opacity" = "1.0";
        shadow = {
          "enabled" = "false";
          "range" = "4";
          "render_power" = 3;
          "color" = "rgba(1a1a1aee)";
        };
        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";
          "vibrancy" = "0.1696";
        };
      };
      animations = {
        "enabled" = "true";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      dwindle = {
        pseudotile = "true";
        "preserve_split" = "true";
      };
      master = {
        "new_status" = "master";
      };
      misc = {
        "force_default_wallpaper" = "0";
        "disable_hyprland_logo" = "true";
      };
      input = {
        kb_layout = "gb";
        follow_mouse = "1";
        sensitivity = "0";
        touchpad = {
          natural_scroll = "true";
          "tap-and-drag" = "false";
        };
      };
      "$mainMod" = "SUPER";
      # Keybinds/shortcuts
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive"
        "$mainMod, M, exit"
        # ADD FILE MANAGER
        "$mainMod, V, togglefloating"
        # ADD MENU THING
        "$mainMod, P, pseudo"
        "$mainMod, B, togglesplit"
        "$mainMod, R, exec, rofi -show drun -show-icons"
        "$mainMod SHIFT, B, exec, ${launchWaybar}/bin/launch-waybar"
        # Move focus with mainMod + arrow keys or vim/hx keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        # Switch workspaces
        "$mainMod SHIFT, l, workspace, +1"
        "$mainMod SHIFT, h, workspace, -1"
        "$mainMod SHIFT, right, workspace, +1"
        "$mainMod SHIFT, left, workspace, -1"
        # Lock screen
        "$mainMod CTRL, L, exec, hyprlock"
        
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Move active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        # Disable /s
      ];
      bindl = [
        ", switch:on:Lid Switch, exec, hyprctl keyword monitor \"eDP-1, disable\""
        ", switch:off:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,preferred,auto,1\""
      ];
      # Keybinds/shortcuts with mouse_down
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "$mainMod, ALT_L, resizewindow"
      ];
      # Laptop multimedia keys
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
}

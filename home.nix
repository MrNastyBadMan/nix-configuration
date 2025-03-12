{ config, pkgs, lib, ... }:

  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      #${pkgs.swww}/bin/swww clear-cache &
      ${pkgs.swww}/bin/swww-daemon &
      sleep 1
      ${pkgs.swww}/bin/swww img ./wallpaper2.jp &
    '';
  in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wrc";
  home.homeDirectory = "/home/wrc";

  
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        exec-once = ''${startupScript}/bin/start'';

        "monitor" = ",preferred,auto,auto";
        "$terminal" = "kitty";
        "$mod" = "SUPER";

        # environment variables
        #"env" = "XCURSOR_SIZE,24";
        #"env" = "HYPRCURSOR_SIZE,24";

        general = {
          "gaps_in" = "5";
          "gaps_out" = "20";

          "border_size" = "2";

          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          "resize_on_border" = "false";
          "allow_tearing" = "true";

          "layout" = "dwindle";
        };

        misc = {
          "force_default_wallpaper" = "0";
          "disable_hyprland_logo" = "true";
        };

        bind = [
          "$mod, Q, exec, $terminal"
          "$mod, M, exit"
        ];
      };
    };
 

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello
    pkgs.fastfetch
    pkgs.kitty
    pkgs.swww

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.kitty.enable = true;
  #programs.kitty = lib.mkForce  {
    #enable = true;
    #settings = {
    #  background_opacity = 0.5;
    #};
  #};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/wrc/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

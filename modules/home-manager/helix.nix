{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox_dark_hard";
    };

    languages = {
      language = [
        {
          name = "rust";
          auto-format = false;
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
      ];

      language-server.rust-analyzer = {
        command = "rust-analyzer";
      };

      language-server.rust-analyzer.config = {
        inlayHints.bindingModeHints.enable = false;
        inlayHints.closingBraceHints.minLines = 10;
        inlayHints.closureReturnTypeHints.enable = "with_block";
        inlayHints.discriminantHints.enable = "fieldless";
        inlayHints.lifetimeElisionHints.enable = "skip_trivial";
        inlayHints.typeHints.hideClosureInitialization = false;
      };
    };

    themes = {
      base16 =
        let
          base00 = "#${config.colorScheme.palette.base00}";
          base01 = "#${config.colorScheme.palette.base01}";
          base02 = "#${config.colorScheme.palette.base02}";
          base03 = "#${config.colorScheme.palette.base03}";
          base04 = "#${config.colorScheme.palette.base04}";
          base05 = "#${config.colorScheme.palette.base05}";
          base06 = "#${config.colorScheme.palette.base06}";
          base07 = "#${config.colorScheme.palette.base07}";
          base08 = "#${config.colorScheme.palette.base08}";
          base09 = "#${config.colorScheme.palette.base09}";
          base0A = "#${config.colorScheme.palette.base0A}";
          base0B = "#${config.colorScheme.palette.base0B}";
          base0C = "#${config.colorScheme.palette.base0C}";
          base0D = "#${config.colorScheme.palette.base0D}";
          base0E = "#${config.colorScheme.palette.base0E}";
          base0F = "#${config.colorScheme.palette.base0F}";
        in
        {
          "attribute" = base09;
          "comment" = {
            fg = base03;
          };
          "constant" = base09;
          "constant.character.escape" = base0C;
          "constant.numeric" = base09;
          "constructor" = base0D;
          "debug" = base03;
          "diagnostic" = {
            modifiers = [ "underlined" ];
          };
          "diff.delta" = base09;
          "diff.minus" = base08;
          "diff.plus" = base0B;
          "error" = base08;
          "function" = base0D;
          "hint" = base03;
          "info" = base0D;
          "keyword" = base0E;
          "label" = base0E;
          "namespace" = base0E;
          "operator" = base05;
          "special" = base0D;
          "string" = base0B;
          "type" = base0A;
          "variable" = base08;
          "variable.other.member" = base0B;
          "warning" = base09;

          "markup.bold" = {
            fg = base0A;
            modifiers = [ "bold" ];
          };
          "markup.heading.1" = {
            fg = base0D;
            modifiers = [ "bold" ];
          };
          "markup.heading.2" = {
            fg = base08;
            modifiers = [ "bold" ];
          };
          "markup.heading.3" = {
            fg = base09;
            modifiers = [ "bold" ];
          };
          "markup.heading.4" = {
            fg = base0A;
            modifiers = [ "bold" ];
          };
          "markup.heading.5" = {
            fg = base0B;
            modifiers = [ "bold" ];
          };
          "markup.heading.6" = {
            fg = base0C;
            modifiers = [ "bold" ];
          };
          "markup.italic" = {
            fg = base0E;
            modifiers = [ "italic" ];
          };
          "markup.link.text" = base08;
          "markup.link.url" = {
            fg = base09;
            modifiers = [ "underlined" ];
          };
          "markup.list" = base08;
          "markup.quote" = base0C;
          "markup.raw" = base0B;
          "markup.strikethrough" = {
            modifiers = [ "crossed_out" ];
          };

          # dumb fucking shit doesnt work
          #        "diagnostic.hint" = { underline.style = "curl"; };
          #        "diagnostic.info" = { underline.style = "curl"; };
          #        "diagnostic.warning" = { underline.style = "curl"; };
          #        "diagnostic.warning" = { underline.style = "curl"; };

          "ui.background" = {
            bg = base00;
          };
          "ui.bufferline.active" = {
            fg = base00;
            bg = base03;
            modifiers = [ "bold" ];
          };
          "ui.bufferline" = {
            fg = base04;
            bg = base00;
          };
          "ui.cursor" = {
            fg = base03;
            modifiers = [ "reversed" ];
          };
          "ui.cursor.primary.insert" = {
            fg = base05;
            modifiers = [ "reversed" ];
          };
          "ui.cursorline.primary" = {
            fg = base05;
            bg = base01;
          };
          "ui.cursor.match" = {
            fg = base05;
            bg = base02;
            modifiers = [ "bold" ];
          };
          "ui.cursor.primary.select" = {
            fg = base05;
            modifiers = [ "reversed" ];
          };
          "ui.gutter" = {
            bg = base00;
          };
          "ui.help" = {
            fg = base06;
            bg = base01;
          };
          "ui.linenr" = {
            fg = base03;
            bg = base00;
          };
          "ui.linenr.selected" = {
            fg = base04;
            bg = base01;
            modifiers = [ "bold" ];
          };
          "ui.menu" = {
            fg = base05;
            bg = base01;
          };
          "ui.menu.scroll" = {
            fg = base03;
            bg = base01;
          };
          "ui.menu.selected" = {
            fg = base01;
            bg = base04;
          };
          "ui.popup" = {
            bg = base01;
          };
          "ui.selection" = {
            bg = base02;
          };
          "ui.selection.primary" = {
            bg = base02;
          };
          "ui.statusline" = {
            fg = base04;
            bg = base01;
          };
          "ui.statusline.inactive" = {
            bg = base01;
            fg = base03;
          };
          "ui.statusline.insert" = {
            fg = base00;
            bg = base0B;
          };
          "ui.statusline.normal" = {
            fg = base00;
            bg = base03;
          };
          "ui.statusline.select" = {
            fg = base00;
            bg = base0F;
          };
          "ui.text" = base05;
          "ui.text.directory" = base0D;
          "ui.text.focus" = base05;
          "ui.virtual.indent-guide" = {
            fg = base03;
          };
          "ui.virtual.inlay-hint" = {
            fg = base03;
          };
          "ui.virtual.ruler" = {
            bg = base01;
          };
          "ui.virtual.jump-label" = {
            fg = base0A;
            modifiers = [ "bold" ];
          };
          "ui.window" = {
            bg = base01;
          };
        };
    };
  };
}

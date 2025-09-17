{
  pkgs,
  lib,
  ...
}:
{
  catppuccin.helix = {
    enable = true;
    useItalics = true;
  };

  programs.helix = {
    enable = true;

    settings = {
      editor = {
        bufferline = "multiple";
        cursorline = true;
        line-number = "relative";
        rulers = [ 120 ];
        true-color = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          character = "|";
          render = true;
        };

        lsp = {
          auto-signature-help = false;
          display-messages = true;
        };
      };
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
  };
}

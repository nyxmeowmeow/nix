{ lib, ... }: {
  programs.nixvim.lsp = {
    inlayHints.enable = false;
    servers = {
      nixd.enable = true;
      qmlls.enable = true;
      # hls = {
      #   enable = true;
      #   installGhc = false;
      # };
      clangd.enable = true;
      rust_analyzer = {
        enable = true;
        # installRustc = false;
        # installCargo = false;
      };
    };

    keymaps = [
    {
      key = "gt";
      lspBufAction = "definition";
    }
    {
      key = "gT";
      lspBufAction = "declaration";
    }
    {
      key = "gV";
      lspBufAction = "references";
    }
    {
      key = "gb";
      lspBufAction = "type_definition";
    }
    {
      key = "gn";
      lspBufAction = "implementation";
    }
    {
      key = "K";
      lspBufAction = "hover";
    }
    {
      action = ":Telescope lsp_definitions<cr>"; # TODO
      key = "<Leader>t";
    }
    # {
    #   action = "<CMD>Lspsaga hover_doc<Enter>";
    #   key = "K";
    # }
    ];
  };
}

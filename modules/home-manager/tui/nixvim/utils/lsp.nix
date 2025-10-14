{ lib, ... }: {
  programs.nixvim.lsp = {
    # enable = true;
    inlayHints.enable = true;
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
      lspBufAction = "references";
    }
    {
      key = "gb";
      lspBufAction = "type_definition";
    }
    {
      key = "gm";
      lspBufAction = "implementation";
    }
    {
      key = "K";
      lspBufAction = "hover";
    }
    {
      action = ":lua require('telescope.builtin').lsp_definitions<cr>";
      key = "<Leader>t";
    }
    # {
    #   action = "<CMD>Lspsaga hover_doc<Enter>";
    #   key = "K";
    # }
    ];
  };
}

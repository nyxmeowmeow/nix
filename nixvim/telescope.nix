{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
          keymaps = {
            "<leader><space>" = "oldfiles";
          };
      };
		};
}

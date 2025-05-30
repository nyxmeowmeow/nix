{ ... }: {
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
          keymaps = {
            "<leader><space>" = "find_files";
          };
      };
		};
}

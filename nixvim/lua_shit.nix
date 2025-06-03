{
  programs.nixvim = {
    extraConfigLua = /* lua */ ''


-- reminder to use <c-o> instead of o<esc>

      local inserted_text = false
      vim.api.nvim_create_autocmd("InsertEnter", {
          callback = function()
          inserted_text = false
          end
          })
    vim.api.nvim_create_autocmd("TextChangedI", {
        callback = function()
        inserted_text = true
        end
        })
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
        if not inserted_text then
        vim.api.nvim_echo({{"use <C-o> idiot", "WarningMsg"}}, false, {})
        end
        end
        })
    '';
  };
}

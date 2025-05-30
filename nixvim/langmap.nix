{
programs.nixvim = {
extraConfigLua = /* lua */ ''
      print("Hello world!")

local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[qwfrtyuiopasdfghjkl'zxcvbnm;/,\t{}]]
local ru = [[qcyb{jpnklsdo}ghaei`zfuwtmv;/,x'()]]
local en_shift = [[QWFRTYUIOPASDFGHJKL'ZXCVBNMT]]
local ru_shift = [[QCYB_JPNKLSDO_GHAEI`ZFUWTMV_]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
    .. ';'
    .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')













'';
extraConfigVim = ''

function! RunMacroWithLangremap(registerLetter, count)
    set langremap
    execute "normal " .. a:count .. "@" .. a:registerLetter
    set langnoremap
endfunction

let mapleader = " "

for letter in split('a b c d e f g h i j k l m n o p q r s t u v w x y z')
    execute 'nnoremap'
    \   .. ' <Leader>q' .. letter
    \   .. ' :<C-U>call RunMacroWithLangremap("' .. letter .. '", v:count1)<CR>'
endfor
'';
};
}

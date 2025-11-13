(use-package catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

(set-frame-parameter nil 'alpha-background 50)
(add-to-list 'default-frame-alist '(alpha-background . 50))

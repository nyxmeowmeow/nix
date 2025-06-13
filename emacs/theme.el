(use-package catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)



(set-frame-parameter (selected-frame) 'alpha '(80 . 80))  ;; active . inactive
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))

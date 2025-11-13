(setq-default mode-line-format nil)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-c h" . centaur-tabs-backward)
  ("C-c i" . centaur-tabs-forward)
  )

(setq centaur-tabs-set-icons t)
(setq centaur-tabs-icon-type 'nerd-icons)  ; or 'nerd-icons
(setq centaur-tabs-label-fixed-length 8)


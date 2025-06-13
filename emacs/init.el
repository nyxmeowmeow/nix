;; Disable the startup screen
(setq inhibit-startup-screen t)

;; Set up package.el and MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Always install packages automatically
(setq use-package-always-ensure t)





;; Enable line numbers
(global-display-line-numbers-mode t)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Show matching parentheses
(show-paren-mode 1)

;; Set font and theme
(set-face-attribute 'default nil :font "mononoki nerd font mono" :height 250)

(load-file "~/.emacs.d/meow.el")
(load-file "~/.emacs.d/theme.el")

(setq initial-frame-alist default-frame-alist)
(setq default-frame-alist default-frame-alist)

(menu-bar-mode -1)    ;; Disable the menu bar
(tool-bar-mode -1)    ;; Disable the tool bar
(scroll-bar-mode -1)  ;; Disable the scroll bar



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package dirvish
  :init
  (dirvish-override-dired-mode)  ; replace `dired` with `dirvish`
  :config
  (setq dirvish-attributes
        '(nerd-icons vc-state))
  (dirvish-override-dired-mode)
  :bind
  ("C-c y" . dirvish)




  )


(with-eval-after-load 'dirvish
  (define-key dirvish-mode-map (kbd "h") 'dired-up-directory)
  (define-key dirvish-mode-map (kbd "i") 'dired-find-file)
  (define-key dirvish-mode-map (kbd "TAB") 'dirvish-subtree-toggle)
  (define-key dirvish-mode-map (kbd "SPC") 'dirvish-dispatch)
  (define-key dirvish-mode-map (kbd "a") 'dired-next-line)
  (define-key dirvish-mode-map (kbd "e") 'dired-previous-line)
  )


(setq dirvish-preview-dispatchers
      (list 'image 'archive 'pdf 'font 'video))

(use-package nerd-icons
  :if (display-graphic-p))



; disable line numbers
(add-hook 'dired-mode-hook
          (lambda () (display-line-numbers-mode -1)))

(setq dired-listing-switches "-Bhl --group-directories-first --almost-all")


(dirvish-define-preview eza (file)
  "Use `eza' to generate directory preview."
  :require ("eza") ; tell Dirvish to check if we have the executable
  (when (file-directory-p file) ; we only interest in directories here
    `(shell . ("eza" "--oneline" "-a" "--color=always" "--icons=always"
               "--group-directories-first" ,file))))

(push 'eza dirvish-preview-dispatchers)

(setq dirvish-quick-access-entries
      '(("h" "home" "~")
        ("d" "Downloads" "~/Downloads")
        ("c" ".config" "~/.config")
        ("n" "nix" "~/nix")
        ))


(with-eval-after-load 'dirvish
  (define-key dirvish-mode-map (kbd "SPC") #'dirvish-quick-access))

(setq dirvish-default-layout '(0 0.4 0.6))



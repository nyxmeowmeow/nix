(use-package meow
  :config
  (defun meow-setup ()

    ;; Clear existing bindings
    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("1" . meow-expand-1)
     '("2" . meow-expand-2)
     '("3" . meow-expand-3)
     '("4" . meow-expand-4)
     '("5" . meow-expand-5)
     '("6" . meow-expand-6)
     '("7" . meow-expand-7)
     '("8" . meow-expand-8)
     '("9" . meow-expand-9)
     ;; ... more numbered expand bindings
     ; '("y" . meow-left)
     '("a" . meow-next)
     '("e" . meow-prev)
     ; '("m" . meow-right)
     '("o" . meow-kill)
     '("l" . meow-yank)
     '("j" . meow-save-clipboard)
     '("u" . meow-change)
     '("p" . meow-undo)
     '("/" . meow-visit)
     '("m" . meow-search)
     '("c" . meow-next-word-1)
     '("C" . meow-next-symbol)
     '("t" . meow-back-word)
     '("T" . meow-back-symbol)
     '("x" . meow-line)
     '("f" . meow-find)
     '("d" . meow-till)
     '("h" . meow-inner-of-thing)
     '("i" . meow-bounds-of-thing)
     '("H" . meow-beginning-of-thing)
     '("I" . meow-end-of-thing)
     '("n" . meow-insert)
     '("s" . meow-append)
     '("k" . meow-open-below)
     '("K" . meow-open-above)
     '(";" . meow-cancel-selection)
     '("C-;" . meow-pop-selection)
     '("<backspace>" . meow-delete)
     '("<escape>" . meow-cancel-selection)
     ; '("k" . meow-reverse)
     ))

(defun meow-next-word-1 (n)
  (interactive "p")
   ;; The optional last arg, default value is "w_", C-h s for info about syntax table
  (meow-next-thing meow-word-thing 'word n "w")) 


(defun meow-save-clipboard ()
  "Copy in clipboard."
  (interactive)
  (let ((meow-use-clipboard t))
    (meow-save)))


(setq meow-char-thing-table
      '((?r . round)
        (?b . square)
        (?c . curly)
        (?a . angle)
        (?s . string)
        (?p . paragraph)
        (?l . line)
        (?f . buffer)))

(defun forward-vimlike-word (&optional arg)
  "Alternate `forward-word'. Essentially the same idea as Vim's 'e'."
  (interactive "^p")
  (setq arg (or arg 1))
  (cl-destructuring-bind (sign move-func char-func)
      (if (>= arg 0)
          '(1 skip-syntax-forward char-after)
        '(-1 skip-syntax-backward char-before))
    (with-syntax-table (standard-syntax-table)
      (let ((distance sign))
        (while (and distance (> (abs distance) 0) (> (* arg sign) 0))
          (setq distance
                (when-let ((next-char (funcall char-func))
                           (next-syntax (char-syntax next-char)))
                  (cond ((eq next-syntax ?w)
                         (funcall move-func "w"))
                        ((eq next-syntax ?\ )
                         (prog1
                             (funcall move-func " ")
                           (forward-vimlike-word sign)))
                        (t
                         (funcall move-func "^w ")))))
          (setq arg (- arg sign)))
        (and distance (> (abs distance) 0))))))

(put 'vimlike-word 'forward-op #'forward-vimlike-word)

(setq meow--word-thing 'vimlike-word)

(with-eval-after-load 'meow
  (add-to-list 'meow-expand-exclude-mode-list meow-normal-mode)
)

  (meow-setup)
  (meow-global-mode 1))


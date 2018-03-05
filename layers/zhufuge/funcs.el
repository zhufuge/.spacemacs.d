(with-eval-after-load 'org
  (progn
    (setq org-agenda-files '("~/org"))
    (setq diary-file "~/org/diary")

    (setq my-gtd-file "~/org/gtd.org")
    (setq my-notes-file "~/org/notes.org")

    (setq org-default-notes-file my-gtd-file)

    (with-eval-after-load 'org-agenda
      (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
      (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
        "." 'spacemacs/org-agenda-transient-state/body)
      )

    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline my-gtd-file "Workspace")
             "* TODO [#B] %?\n  %i\n"
             :empty-lines 1)
            ("n" "notes" entry (file+headline my-notes-file "Quick notes")
             "* %?\n  %i\n %U"
             :empty-lines 1)
            ("i" "Ideas" entry (file+headline my-notes-file "Blog Ideas")
             "* TODO [#B] %?\n  %i\n %U"
             :empty-lines 1)
            ("s" "Code Snippet" entry
             (file "~/org/snippets.org")
             "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
             ))

    (setq org-agenda-custom-commands
          '(
            ("w" . "任务安排")
            ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
            ("wb" "重要且不紧急的任务" tags-todo
             "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
            ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
            ;; ("b" "Blog" tags-todo "BLOG")
            ("p" . "项目安排")
            ("W" "Weekly Review"
             ((stuck "")
              (tags-todo "PROJECT")
              ))
            ("f" occur-tree "FIXME")
            ))

    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                  (sequence "WAITING(w@/!)" "HOLD(h@/!)"  "|" "CANCELLED(c@/!)"
                            "MEETING(m)" "PHONE(p)"))))

    (setq org-todo-keyword-faces
          (quote (("TODO" :foreground "red" :weight bold)
                  ("NEXT" :foreground "deep sky blue" :weight bold)
                  ("DONE" :foreground "forest green" :weight bold)
                  ("WAITING" :foreground "orange" :weight bold)
                  ("HOLD" :foreground "magenta" :weight bold)
                  ("CANCELLED" :foreground "dark slate blue" :weight bold)
                  ("MEETING" :foreground "yellow" :weight bold)
                  ("PHONE" :foreground "yellow" :weight bold))))

    (defun org-insert-src-block (src-code-type)
        "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
        (interactive
         (let ((src-code-types
                '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++"
                  "css" "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond"
                  "mscgen" "octave" "oz" "plantuml" "R" "sass" "screen" "sql"
                  "awk" "ditaa" "haskell" "latex" "lisp" "matlab" "ocaml" "org"
                  "perl" "ruby" "scheme" "sqlite")))
           (list (ido-completing-read "Source code type: " src-code-types))))
        (progn
          (newline-and-indent)
          (insert (format "#+BEGIN_SRC %s\n" src-code-type))
          (newline-and-indent)
          (insert "#+END_SRC\n")
          (previous-line 2)
          (org-edit-src-code)))

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i")
                                                 'org-insert-src-block)
                                  ))

      (setq org-plantuml-jar-path
            (expand-file-name "~/.spacemacs.d/plantuml.jar"))
      (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")


      (org-babel-do-load-languages
       'org-babel-load-languages
       '(
         ;; (ruby . t)
         (sh . t)
         (js . t)
         (latex .t)
         (python . t)
         (emacs-lisp . t)
         ;; (plantuml . t)
         (C . t)
         (ditaa . t)))

      ))
;;; org end

;;; 设置 tab 键
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

;;; tab end

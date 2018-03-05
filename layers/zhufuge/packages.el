;;; packages.el --- zhufuge layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <zhufuge@outlook.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst zhufuge-packages
  '(company
    js2-mode
    web-mode
    youdao-dictionary
    iedit
    smartparens
    avy
    typescript-mode
    )
  )

(defun zhufuge/post-init-company ()
  (progn
    (global-company-mode t)
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    )
  )

(defun zhufuge/post-init-js2-mode ()
  (progn
    (add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))

    (setq-default js2-basic-offset 2)

    (defun my-js2-mode-hook ()
      (progn
        (setq forward-sexp-function nil)
        (set (make-local-variable 'semantic-mode) nil)
        ))
    (add-hook 'js2-mode-hook 'my-js2-mode-hook)

    (setq js2-strict-missing-semi-warning nil)
    (setq js2-missing-semi-one-line-override t)
    (setq js2-strict-trailing-comma-warning nil)
    )
  )

(defun zhufuge/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :init
    (progn
      ;; Enable Cache
      (setq url-automatic-caching t)

      ;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
      (push "*Youdao Dictionary*" popwin:special-display-config)

      ;; Set file path for saving search history
      (setq youdao-dictionary-search-history-file "~/.spacemacs.d/.youdao")

      ;; Enable Chinese word segmentation support (支持中文分词)
      (setq youdao-dictionary-use-chinese-word-segmentation t)

      ;; key binding
      (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
      )
    )
  )

(defun zhufuge/post-init-web-mode ()
  (progn
    (add-hook 'web-mode-hook 'smartparens-global-mode)
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

    (setq-default
     css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 2)

    (with-eval-after-load 'web-mode
      (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

    ;; emmet
    (with-eval-after-load 'emmet-mode
      (evil-define-key 'insert emmet-mode-keymap (kbd "TAB") nil)
      (evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") nil)
      (evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") nil)
      (evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") nil)
      (evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") nil)
      (evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") nil)
      (spacemacs|hide-lighter emmet-mode)
      )
    )
  )

(defun zhufuge/init-iedit ()
  (use-package iedit
    :defer t
    :init
    (progn
      (global-set-key (kbd "C-=") 'iedit-mode)
      )
    )
  )

(defun zhufuge/post-init-smartparens ()
  (progn
    (add-hook 'org-mode-hook 'smartparens-mode)
    )
  )

(defun zhufuge/post-init-avy ()
  (progn
    (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)
    )
  )

(defun zhufuge/post-init-typescript-mode ()
  (progn
    (setq typescript-indent-level 2)
    )
  )

;;; packages.el ends here

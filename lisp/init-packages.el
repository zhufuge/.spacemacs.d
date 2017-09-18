;; (global-company-mode)

;; powerline
(setq powerline-default-separator 'arrow)
(spaceline-compile)
;; -----------------------------------------------------


;; org
(add-hook 'org-mode-hook 'smartparens-mode)
(setq org-bullets-bullet-list '("■" "◆" "▲" "●"))
;; -----------------------------------------------------


;; web
(add-hook 'web-mode-hook 'smartparens-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

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
;; -----------------------------------------------------


;; js
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))


(setq-default js2-basic-offset 2)

(defun my-js2-mode-hook ()
  (progn
    (setq forward-sexp-function nil)
    ;; (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
    (set (make-local-variable 'semantic-mode) nil)
    ))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(add-hook 'js2-jsx-mode-hook 'emmet-mode)

;; missing-warning
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override t)
(setq js2-strict-trailing-comma-warning nil)
;; ----------------------------------------------------


;; youdao
;; Enable Cache
(setq url-automatic-caching t)

;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
(push "*Youdao Dictionary*" popwin:special-display-config)

;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.spacemacs.d/.youdao")

;; Enable Chinese word segmentation support (支持中文分词)
(setq youdao-dictionary-use-chinese-word-segmentation t)
;; ---------------------------------------------------

(provide 'init-packages)

(global-company-mode)

(setq powerline-default-separator 'arrow)
(spaceline-compile)

(add-hook 'org-mode-hook 'smartparens-mode)
(setq org-bullets-bullet-list '("■" "◆" "▲" "●"))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq-default js2-basic-offset 2)

;; (setq eclim-eclipse-dirs '("D:/tool/eclipse")
;;       eclim-executable "D:/tool/eclipse/eclim")
;; (setq eclimd-default-workspace "d:/File/Program-Edit/Java/learnJava")
;; (setq help-at-pt-display-when-idle t)
;; (setq help-at-pt-timer-delay 0.1)
;; (help-at-pt-set-timer)
;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)

;; (setq
;;  ;; Use another eclimd executable
;;  eclimd-executable "D:/tool/eclipse/eclim"
;;  ;; Specify the workspace to use by default
;;  eclimd-default-workspace "d:/File/Program-Edit/Java/learnJava"
;;  ;; Whether or not to block emacs until eclimd is ready
;;  eclimd-wait-for-process t
;;  )


(defun my-js2-mode-hook ()
  (progn
    (setq forward-sexp-function nil)
    ;; (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
    (set (make-local-variable 'semantic-mode) nil)
    ))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)


(add-hook 'web-mode 'smartparens-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

(provide 'init-packages)

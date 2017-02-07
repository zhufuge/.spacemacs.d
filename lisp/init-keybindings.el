(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window-below)
(global-set-key [f3] 'split-window-right)
(global-set-key [f4] 'delete-window)
(global-set-key [f9] 'eshell)
(global-set-key [f10] 'helm-mini)
(global-set-key [f11] 'imenu-list-minor-mode)
(global-set-key [f12] 'org-agenda)

(global-set-key (kbd "M-p") 'fixup-whitespace)

;; (global-set-key (kbd "M-[") 'previous-buffer)
;; (global-set-key (kbd "M-]") 'next-buffer)

(global-set-key (kbd "\C-s") 'helm-swoop)

(global-set-key (kbd "C-;") 'ace-jump-mode)

(global-set-key (kbd "C-<tab>") 'hs-toggle-hiding)

(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "of" 'recentf-open-files)
(spacemacs/set-leader-keys "oc" 'cua-mode)

(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-t") 'yas-expand)

(with-eval-after-load 'emmet-mode
  (progn
    (evil-define-key 'insert emmet-mode-keymap (kbd "TAB") nil)
    (evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") nil)
    (evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") nil)
    (evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") nil)
    (evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") nil)
    (evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") nil)
    (spacemacs|hide-lighter emmet-mode)))


;; (global-set-key (kbd "TAB") 'tab-indent-or-complete)
;; (with-eval-after-load 'web-mode
;;   (define-key web-mode-map (kbd "TAB") 'emmet-expand-yas)
;;   )

(global-set-key (kbd "C-=") 'iedit-mode)

(provide 'init-keybindings)

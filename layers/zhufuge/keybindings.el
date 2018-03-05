;; 复制
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; 查询
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 窗口
(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window-below)
(global-set-key [f3] 'split-window-right)
(global-set-key [f4] 'delete-window)
;; 主题功能
(global-set-key [f9] 'eshell)
(global-set-key [f10] 'ibuffer)
(global-set-key [f11] 'imenu-list-minor-mode)
(global-set-key [f12] 'org-agenda)

;; 去除空格
(global-set-key (kbd "M-p") 'fixup-whitespace)

;; buffer翻页
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;; 折叠
(global-set-key (kbd "C-<tab>") 'hs-toggle-hiding)

;; 模块功能
(spacemacs/set-leader-keys "of" 'recentf-open-files)
(spacemacs/set-leader-keys "oc" 'cua-mode)

;; org？
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

;; 模板补全
(global-set-key (kbd "C-t") 'yas-expand)

;; 设置 tab 键
(global-set-key (kbd "TAB") 'tab-indent-or-complete)

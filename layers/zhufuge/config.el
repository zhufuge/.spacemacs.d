;; 项目缓存
(setq projectile-enable-caching t)

;; 滚动优化
(setq scroll-margin 3 scroll-conservatively 10000)

;; 窗口标题
(setq frame-title-format "%b  @6ml-Spacemacs")

;; 鼠标动作
(mouse-avoidance-mode 'animate)

;; tab key
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


;; indent
(setq c-basic-offset 4)
(setq c++-basic-offset 4)
(setq-default js-indent-level 2)

;; font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family "Microsoft Yahei" :size 19)))

;; 设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用
  ;; (setq garbage-collection-messages t)
  )

;; org
(add-hook 'org-mode-hook 'smartparens-mode)
(setq org-bullets-bullet-list '("■" "◆" "▲" "●"))


;; custom 配置文件
(setq custom-file
      (expand-file-name "~/.spacemacs.d/custom.el" user-emacs-directory))

(load custom-file 'no-error 'no-message)

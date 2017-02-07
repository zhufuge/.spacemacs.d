(setq projectile-enable-caching t)

(setq scroll-margin 3 scroll-conservatively 10000)

(setq frame-title-format "%b  @6ml-Spacemacs")

(mouse-avoidance-mode 'animate)

(defun my-desktop()
  "find my desktop"
  (interactive)
  (find-file "C:/Users/L6ml/Desktop/")
  )


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
(defun my-font (e-size c-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  "Source Code Pro Medium" e-size))
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "Microsoft Yahei" :size c-size)))
  )
(my-font 19 19)
;;(my-font (* 19 2) (* 24 2))


(provide 'init-better-defaults)

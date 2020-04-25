

(use-package evil)
(evil-mode 1)


;;(set-face-background 'region "#ffffaf")
;;  (add-hook 'evil-insert-state-entry-hook (lambda () (set-face-background 'hl-line "#121212")))
;; (add-hook 'evil-normal-state-entry-hook (lambda () (set-face-background 'hl-line "#4e4e4e")))

(setq evil-visual-state-cursor 'hbar)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor 'box)

;; (shell-command "im-select com.sogou.inputmethod.sogou.pinyin")
;; (shell-command "im-select com.apple.keylayout.US")


;; (setq fcitx-prefix-keys-polling-time 0.05)
;; (fcitx-aggressive-setup)
;(defvar fcitx-prefix-keys-polling-time 0.01 "Time interval to execute prefix keys polling function.")


;;; switch input source by  https://github.com/vovkasm/input-source-switcher
;; method0 是英文输入法，method1是中文输入法
(setq input-switch-method0 "com.apple.keylayout.US")
(setq input-switch-method1 "com.sogou.inputmethod.sogou.pinyin")
(setq input-switch-is-on t)

;; 通过运行命令切换输入法
(defun input-switch-use-method (method)
  (when input-switch-is-on
    (shell-command (replace-regexp-in-string "method" method "issw method"))))

;; 开启或关闭输入法切换
(defun input-switch-enable () (interactive) (setq input-switch-is-on t))
(defun input-switch-disable () (interactive) (setq input-switch-is-on nil))

;; (setq shell-file-name "zsh")
;; (setenv "SHELL" shell-file-name)
;; (shell-command "swim use com.sogou.inputmethod.sogou.pinyin")
;;(dired-run-shell-command "issw com.sogou.inputmethod.sogou.pinyin")

;;进入insert mode切换第二输入法（中文）
;(add-hook 'evil-insert-state-entry-hook (lambda () (input-switch-use-method input-switch-method1)))
;; 进入 normal mode 切换第一输入法 英文
;;(add-hook 'evil-normal-state-entry-hook
;;          (lambda () (input-switch-use-method input-switch-method0)))
;;退出insert mode切换第一输入法（英文）
;(add-hook 'evil-insert-state-exit-hook (lambda () (input-switch-use-method input-switch-method0)))


;; method number1 to switch input source
(use-package fcitx)
(fcitx-aggressive-setup)

(provide 'init-evil)

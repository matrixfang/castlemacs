;; This is your private configuration file. It is loaded automatically, so feel free to add whatever you want.
;; This file will not be affected by Castlemacs updates.
(use-package evil-leader
  :ensure t)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
)


(load-file "~/.emacs.d/private/init-ui.el")
(load-file "~/.emacs.d/private/init-org.el")


;; set font
(set-face-attribute 'default nil
                    ;:family "Source Code Pro for Powerline"
                    :height 160
                    :weight 'medium
                    :width 'medium)

;; (if (display-graphic-p)
;;     (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;       (set-fontset-font (frame-parameter nil 'font)
;;                         charset (font-spec :family "Microsoft Yahei"
;;                                            :size 14)))
;; )


;;; set neo theme
  (setq neo-vc-integration '(face))
  (setq neo-theme 'icons)
  (setq org-startup-indented t)
  (setq-default neo-show-hidden-files t)


;;禁止emacs一个劲的叫
(setq visible-bell t);

(find-file "~/org/alpha.org")


;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

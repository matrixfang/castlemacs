

;; dashboard
(use-package dashboard
  :ensure t
  :init
  (setq dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-set-navigator t
        dashboard-startup-banner (expand-file-name "logo.png" user-emacs-directory)
        dashboard-heading-icons '((recents   . "file-text")
                                   (bookmarks . "bookmark")
                                   (agenda    . "calendar")
                                   (projects  . "briefcase"))
        dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face)
        )
  :config
  (dashboard-setup-startup-hook)

)

(provide 'init-dashboard)

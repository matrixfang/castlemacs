;; use break lines

;;(use-package page-break-lines)
;;dashboard
(use-package dashboard
  :init
  (setq dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-set-navigator t
        dashboard-center-content t
        dashboard-set-navigator t
        dashboard-startup-banner (expand-file-name "logo.png" user-emacs-directory)
        dashboard-items '((recents  . 5)
                          (projects . 5)
                          (bookmarks . 5)
                          (agenda . 5))
        dashboard-heading-icons '((recents   . "file-text")
                                  (projects  . "file-directory")
                                  (bookmarks . "bookmark")
                                  (agenda    . "calendar"))
        dashboard-set-footer t
        )
  :config
  (dashboard-setup-startup-hook)
)




(provide 'init-dashboard)

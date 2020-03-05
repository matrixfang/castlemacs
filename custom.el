;; This file is used for the built-in customization UI in Emacs (M-x customize)
;; This file will not be affected by Castlemacs updates
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(beacon-color "#f2777a")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("3ee39fe8a6b6e0f1cbdfa33db1384bc778e3eff4118daa54af7965e9ab8243b3" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "1b2ad37ab42d520aecc4a17c806381273176ab9f463288536f1df304b68e54d1" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "ed573618e4c25fa441f12cbbb786fb56d918f216ae4a895ca1c74f34a19cfe67" "054e929c1df4293dd68f99effc595f5f7eb64ff3c064c4cfaad186cd450796db" "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121" "58c2c8cc4473c5973e77f4b78a68c0978e68f1ddeb7a1eb34456fce8450be497" "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3" "3f5f69bfa958dcf04066ab2661eb2698252c0e40b8e61104e3162e341cee1eb9" "0f0a4dca8bb029dc5139f447ff25bc3c18d31872c30a46d03c6bbc706ded3586" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "672bb062b9c92e62d7c370897b131729c3f7fd8e8de71fc00d70c5081c80048c" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "ba40a3b8b2f99249176d42f637e12897ae5d75373697bb36254a8130f635d284" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (quote
    ("#EFFF00" "#73CD4F" "#83DDFF" "MediumPurple1" "#66CDAA" "DarkOrange" "HotPink1" "#809FFF" "#ADFF2F")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-paren-background-colors
   (quote
    ("#00FF99" "#CCFF99" "#FFCC99" "#FF9999" "#FF99CC" "#CC99FF" "#9999FF" "#99CCFF" "#99FFCC" "#7FFF00")))
 '(hl-paren-colors (quote ("#326B6B")))
 '(hl-sexp-background-color "#efebe9")
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(objed-cursor-color "#ff5555")
 '(org-agenda-files
   (quote
    ("~/org/become_a_hacker.org" "~/org/english_learning.org" "~/org/gtd.org" "~/org/math.org" "~/org/entertainments.org" "~/org/notes.org" "~/org/tasks.org" "~/org/projects.org" "~/org/wtasks.org" "~/org/journal.org" "~/org/wjournal.org" "~/org/birthday.org")))
 '(org-src-block-faces
   (quote
    (("emacs-lisp"
      (:background "#F0FFF0"))
     ("dot"
      (:foreground "gray50")))))
 '(package-selected-packages
   (quote
    (dashboard benchmark-init organic-green-theme kaolin-themes solarized-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow gruvbox-theme green-screen-theme zenburn-theme monokai-theme leuven-theme doom-themes dracula-theme dracula doom-monakai evil-leader nyan-mode doom-modeline evil emmet-mode web-mode markdown-mode haml-mode yaml-mode define-word powerthesaurus flyspell-correct-popup flyspell-correct company shell-pop git-gutter magit counsel-projectile ivy-rich avy flx smex counsel swiper ivy projectile multiple-cursors visual-regexp move-text expand-region which-key vi-tilde-fringe neotree rich-minority smartparens all-the-icons undo-tree simpleclip exec-path-from-shell use-package)))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-universal-key "s-=")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

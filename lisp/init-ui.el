;;open tool-bar on the top of emacs.app
;;(tool-bar-mode t)

;;frame resize by pixel
;;(setq frame-resize-pixelwise t)
;;scrolling

;; (setq
;;  hscroll-step 1
;;  scroll-conservatively 10000)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
;;(global-visual-line-mode t)
(global-visual-line-mode 1)

;; set transparency loops
(global-set-key [(f5)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))

(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )


;;; cycle theme based on time (dawn day dusk night)
(setq dawn-theme 'moe-light) ;gruvbox-light-soft doom-solarized-light
(setq day-theme 'kaolin-light) ;;organic-green kaolin-light  doom-nord-light
(setq dusk-theme 'solarized-light) ;; kaolin-valley-light
(setq dark-theme 'dracula)
;; sanityinc-solarized-dark -blue -night -eighties


(defun synchronize-theme ()
  (interactive)
    (setq hour
        (string-to-number
            (substring (current-time-string) 11 13)))
    (if (member hour (number-sequence 5 18))
        (setq now day-theme)
      (setq now dark-theme))
    (cond ((member hour (number-sequence 5 7)) (setq now dawn-theme))
          ((member hour (number-sequence 8 16)) (setq now day-theme))
          ((member hour (number-sequence 17 18)) (setq now dusk-theme))
    )
    (load-theme now)
    )
(run-with-timer 0 3600 'synchronize-theme)
(synchronize-theme)
;;(current-time-string)
;; (defun font-set ()
;;   (set-default-font "Fixedsys Excelsior 3.01 12")
;;   (dolist
;;     (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;       charset
;;       (font-spec :family "Microsoft Yahei" :size 16)))
;; )




(defun day ()
  (interactive)
  (load-theme day-theme)
)

(defun dark ()
  (interactive)
  (load-theme dark-theme)
  )

(defun dawn()
(interactive)
(load-theme dawn-theme)
)

(defun dusk()
  (interactive)
  (load-theme dusk-theme))

;; Cycle through this set of themes

;; not good themes
;; light-blue
(defvar samray-theme-list '(solarized-light tsdh-light organic-green moe-light spacemacs-light spacemacs-dark moe-dark zenburn doom-dracula monokai sanityinc-tomorrow-eighties gruvboxm  dichromacy wombat jazz leuven  ))

(defvar samray-current-theme nil)
(defun samray/cycle-theme ()
  "Cycle through a list of themes, samray-theme-list."
  (interactive)
  (when samray-current-theme
    (setq samray-theme-list (append samray-theme-list (list samray-current-theme))))
  (setq samray-current-theme (pop samray-theme-list))
  (load-theme  samray-current-theme t)
  )

;;; Disable theme before load a new theme
(defadvice load-theme
    (before theme-dont-propagate activate)
  "Disable theme before load theme."
  (mapc #'disable-theme custom-enabled-themes)
  (set-face-attribute 'fringe nil :background nil :foreground nil))

(evil-leader/set-key
  "l" 'load-theme
)

;; rainbow-delimiters
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(show-paren-mode t)
;(load-theme 'organic-green t)

(provide 'init-ui)

;;open tool-bar on the top of emacs.app
;;
;;(tool-bar-mode t)
;;frame resize
(setq frame-resize-pixelwise t)
;;scrolling

(setq
 hscroll-step 1
 scroll-conservatively 1000)

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


;; load theme



;; cycle theme between day and night
(setq day-theme 'tsdh-light)
(setq dark-theme 'dracula)

(defun synchronize-theme ()
    (setq hour
        (string-to-number
            (substring (current-time-string) 11 13)))
    (if (member hour (number-sequence 6 16))
        (setq now day-theme)
        (setq now dark-theme))
    (load-theme now)

)

;; (defun font-set ()
;;   (set-default-font "Fixedsys Excelsior 3.01 12")
;;   (dolist
;;     (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;       charset
;;       (font-spec :family "Microsoft Yahei" :size 16)))
;; )

(synchronize-theme)


(defun day ()
  (interactive)
  (load-theme 'leuven)
  (font-set)
)

(defun dark ()
  (interactive)
  (load-theme 'wombat)
  (font-set)
)

;; some settings
(setq org-latex-create-formula-image-program 'dvisvgm)
(setq org-todo-keywords
      '((sequence "TODO" "HAND" "|" "DONE")))
;; 使用 easy templates
;; (require 'org-tempo)
;; (add-to-list 'org-modules 'org-tempo)

;; org 折叠符号
(setq org-ellipsis "⤵")

;; agenda 里面时间块色彩显示
;; From: https://emacs-china.org/t/org-agenda/8679/3
(defun ljg/org-agenda-time-grid-spacing ()
  "Set different line spacing w.r.t. time duration."
  (save-excursion
    (let* ((background (alist-get 'background-mode (frame-parameters)))
           (background-dark-p (string= background "dark"))
           (colors (list "#1ABC9C" "#2ECC71" "#3498DB" "#9966ff"))
           pos
           duration)
      (nconc colors colors)
      (goto-char (point-min))
      (while (setq pos (next-single-property-change (point) 'duration))
        (goto-char pos)
        (when (and (not (equal pos (point-at-eol)))
                   (setq duration (org-get-at-bol 'duration)))
          (let ((line-height (if (< duration 30) 1.0 (+ 0.5 (/ duration 60))))
                (ov (make-overlay (point-at-bol) (1+ (point-at-eol)))))
            (overlay-put ov 'face `(:background ,(car colors)
                                                :foreground
                                                ,(if background-dark-p "black" "white")))
            (setq colors (cdr colors))
            (overlay-put ov 'line-height line-height)
            (overlay-put ov 'line-spacing (1- line-height))))))))

(add-hook 'org-agenda-finalize-hook #'ljg/org-agenda-time-grid-spacing)



;;org templates org 模板
(defun random-alphanum ()
  (let* ((charset "abcdefghijklmnopqrstuvwxyz0123456789")
         (x (random 36)))
    (char-to-string (elt charset x))))

(defun create-password ()
  (let ((value ""))
    (dotimes (number 16 value)
      (setq value (concat value (random-alphanum))))))


(defun get-or-create-password ()
  (setq password (read-string "Password: "))
  (if (string= password "")
      (create-password)
    password))


(setq org-capture-templates
      '(("p" "Passwords" entry (file "~/org/passwords.org")
         "* %U - %^{title} %^G\n\n  - 用户名: %^{用户名}\n  - 密码: %(get-or-create-password)"
         :empty-lines 1 :kill-buffer t)

        ("B" "Things I want to buy" entry (file+headline
                                           "~/programming/org/projects/managing-my-monies.org" "things I want to buy")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("c" "Computers Anything")
        ("ca" "Awesome WM" entry (file+headline "~/programming/org/gtd.org" "awesome WM someday")
         "* TODO %?\nEntered on %U\n  %i\n  %a")


         ;; Emacs things
        ("ce" "Emacs")

        ("ceb" "bugs" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "Emacs bugs")
         "* TODO %?\n  %i\n  %a")

        ("ceb" "evil-mode" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "evil-mode")
         "* TODO %?\n  %i\n  %a")

        ("cef" "flycheck" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "flycheck-mode")
         "* TODO %?\n  %i\n  %a")

        ("ceM" "Emacs Meetup" entry (file+headline "~/programming/org/projects/emacs-meetup-vincent-laf-emacslaf.org" "things to talk about")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("ceo" "Org-mode" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "org-mode")
         "* TODO %?\n  %i\n  %a")
         ("ceR" "Emacs Reference")
        ("ceRR" "Emacs Reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "emacs reference")
         "* %?\nEntered on %U\n  %i\n  %a")
         ("ceRe" "emacs evil reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "evil reference")
         "* TODO %?\n  %i\n  %a")
         ("ceRg" "emacs gnus reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "gnus reference")
         "* TODO %?\n  %i\n  %a")
        ("ceRo" "emacs org reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "org reference")
         "* TODO %?\n  %i\n  %a")
        ("ceRm" "emacs magit reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "tags reference")
         "* TODO %?\n  %i\n  %a")
        ("ceRt" "emacs tags reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "tags reference")
         "* TODO %?\n  %i\n  %a")

         ("cet" "emacs Todo")
        ("cett" "emacs Todo" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "emacs someday")
         "* TODO %?\n  %i\n  %a")
        ("cete" "emacs evil someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "evil someday")
         "* TODO %?\n  %i\n  %a")
        ("cetf" "emacs flycheck someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "flycheck someday")
         "* TODO %?\n  %i\n  %a")
        ("cetg" "emacs gnus someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "gnus someday")
         "* TODO %?\n  %i\n  %a")
        ("ceth" "emacs helm someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "helm someday")
         "* TODO %?\n  %i\n  %a")
        ("ceto" "emacs org someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "org someday")
         "* TODO %?\n  %i\n  %a")
        ("cetT" "emacs tags someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "tags someday")
         "* TODO %?\n  %i\n  %a")
        ("cetw" "web-mode someday" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "web-mode someday")
         "* TODO %?\n  %i\n  %a")
         ;;End Emacs things


        ("cG" "Gimp Basics Reference" entry (file+headline "~/manuals/gimp.org" "Basic Concepts")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("cH" "The GNU HURD")
        ("cHt" "Hurd" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org"
                                           "Hurd")
         "* TODO %?\n  %i\n  %a")
        ("ct" "General Computer TODO"
         entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "General TODO")
         "* TODO %?\n  %i\n  %a")
        ("cw" "Waypoint")
        ("cwi" "ibca Web App")
        ("cwib" "bugs that need fixin'" entry (file+headline "~/programming/org/projects/working-for-waypoint.org"
                                                             "bugs that need fixin'")
         "* TODO %?\n  %i\n  %a")
        ("cwic" "core features that must be done" entry (file+headline "~/programming/org/projects/working-for-waypoint.org"
                                                                       "core features that must be done")
         "* TODO %?\n  %i\n  %a")
        ("cwif" "features the app should have" entry (file+headline "~/programming/org/projects/working-for-waypoint.org"
                                                                    "features the app should have") "* TODO %?\n  %i\n  %a")
        ("cwir" "IBCA Reference" entry (file+headline "~/programming/org/projects/working-for-waypoint.org"
                                                      "IBCA Reference") "* %?\nEntered on %U\n  %i\n  %a")
        ("cwiw" "what I have done" entry (file+headline "~/programming/org/projects/working-for-waypoint.org"
                                                        "what I have done") "* DONE %?\n  %i\n  %a")
        ("ch" "high star todo"
         entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "make high star an android app")
         "* todo %?\n  %i\n  %a")
        ("cl" "linux TODO" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "linux someday")
         "* TODO %?\n  %i\n  %a")
        ("cL" "Linux Reference" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "linux reference")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("co" "organ TODO" entry (file+headline "~/programming/org/projects/become-an-awesome-hacker.org" "make organ an android app")
         "* TODO %?\n  %i\n  %a")
        ("cf" "Free the world" entry (file+headline "~/programming/org/gtd.org" "free the world free content")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("cW" "Web")

        ("cWA" "Accrisoft Reference" entry (file+headline "~/programming/org/web.org" "Accrisoft reference")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("cWB" "Bootstrap Reference" entry (file+headline "~/programming/org/web.org" "Bootstrap reference")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("cWS" "Shoppify Reference" entry (file+headline "~/programming/org/web.org" "Shoppify reference")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("cWW" "Web reference" entry (file+headline "~/programming/org/web.org" "Web reference")
         "* %?\nEntered on %U\n  %i\n  %a")


        ("C" "Community")
        ("Cc" "community TODO" entry (file+headline "~/programming/org/gtd.org" "community someday")
         "* TODO %?\n  %i\n  %a")

        ("Cn" "nice things to say" entry (file+headline "~/programming/org/projects/get-close-to-God.org" "nice things to say")
         "* TODO %?\nEntered on %U\n  %i\n  %a")
        ("Cs" "Social Skills Notes" entry (file+headline "~/programming/org/being-social.org" "Social Skills Notes")
         "* %?\nEntered on %U\n  %i\n  %a")

        ("C" "Calendar TODO" entry (file+headline "~/programming/org/gtd.org" "calendar")
         "* TODO %?\n  %i\n  %a")

        ("e" "entertainment")
        ("eb" "Books to Read" entry (file+headline "~/programming/org/projects/whatever-I-want.org"
                                                   "Books to Read") "*  %i\n  %a")
        ("eM" "Good Movies Reference" entry (file+headline "~/programming/org/projects/whatever-I-want.org" "Good Movies") "*  %i\n  %a")
        ("em" "movies to watch" entry (file+headline "~/programming/org/projects/whatever-I-want.org" "movies to watch") "*  %i\n  %a")
        ("eU" "good music reference" entry (file+headline "~/programming/org/projects/whatever-I-want.org"
                                                          "good music reference") "*  %i\n  %a")
        ("eg" "games to play" entry (file+headline "~/programming/org/projects/whatever-I-want.org"
                                                   "games to play") "*  %i\n  %a")




        ("M" "Math")
        ("Mf" "fun math problems" entry (file+headline (concat org-directory "/math.org") "fun math problems") "* TODO %?\n  %i\n  %a")
        ("p" "payless TODO" entry (file+headline "~/programming/org/gtd.org" "shopping todo")
         "* TODO %?\n  %i\n  %a")
        ("r" "Reference" entry (file+headline "~/programming/org/gtd.org" "general reference")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("t" "TODO" entry (file+headline "~/programming/org/gtd.org" "general todo")
         "* TODO %?\nEntered on %U\n  %i\n  %a")
        ("w" "Weblink" entry (file (expand-file-name "~/programming/org/gtd.org" "org capture"))
         "* %c\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  - Quote:\n    %i" :unnarrowed)

        ("q" "Quotations" entry (file+headline "~/programming/org/quotes.org" "Quotations")
         "* %?\nEntered on %U\n  %i\n  %a")
        ))
;;org refile and agenda settings
  (setq org-agenda-files (list "~/org/become_a_hacker.org"
                               "~/org/english_learning.org"
                               "~/org/gtd.org"
                               "~/org/math.org"
                               "~/org/entertainments.org"

                               "~/org/organizer.org"

                               "~/org/notes.org"
                               "~/org/tasks.org"
                               "~/org/projects.org"

                               "~/org/wtasks.org"
                               "~/org/journal.org"
                               "~/org/wjournal.org"

                               "~/org/birthday.org"
                               ))

  (setq org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 2)))
  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
  (setq org-refile-use-outline-path 'file)                  ; Show full paths for refiling
  (setq org-refile-allow-creating-parent-nodes 'confirm)
;; deft settings
  (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-directory "~/Projects/orgs")


;; set org-pomodoro notifer
  (defun notify-osx (title message)
    (call-process "terminal-notifier"
                  nil 0 nil
                  "-group" "Emacs"
                  "-title" title
                  "-sender" "org.gnu.Emacs"
                  "-message" message
                  "-sound" "Glass"
                  "-activate" "oeg.gnu.Emacs"))
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify-osx "Pomodoro completed!" "Time for a break.")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))
  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))
  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))
 ;; (spacemacs/toggle-mode-line-org-clock-on)

;; org LaTeX 公式自动显示
;; auto-toggle-latex-preview
(add-hook 'post-command-hook 'kk/org-latex-fragment-toggle t)


  (defvar kk/org-latex-fragment-last nil
    "Holds last fragment/environment you were on.")

  (defun kk/org-in-latex-fragment-p ()
    "Return the point where the latex fragment begins, if inside
  a latex fragment. Else return false"
    (let* ((el (org-element-context))
           (el-type (car el)))
      (and (or (eq 'latex-fragment el-type) (eq 'latex-environment el-type))
          (org-element-property :begin el))))

  (defun kk/org-latex-fragment-toggle ()
    "Toggle a latex fragment image "
    (and (eq 'org-mode major-mode)
	 (let ((begin (kk/org-in-latex-fragment-p)))
           (cond
            ;; were on a fragment and now on a new fragment
            ((and
              ;; fragment we were on
              kk/org-latex-fragment-last
              ;; and are on a fragment now
              begin

              ;; but not on the last one this is a little tricky. as you edit the
              ;; fragment, it is not equal to the last one. We use the begin
              ;; property which is less likely to change for the comparison.
              (not (and kk/org-latex-fragment-last
			(= begin
			   kk/org-latex-fragment-last))))
             ;; go back to last one and put image back, provided there is still a fragment there
             (save-excursion
               (goto-char kk/org-latex-fragment-last)
               (when (kk/org-in-latex-fragment-p) (org-preview-latex-fragment))

               ;; now remove current image
               (goto-char begin)
               (let ((ov (loop for ov in (org--list-latex-overlays)
                               if
                               (and
				(<= (overlay-start ov) (point))
				(>= (overlay-end ov) (point)))
                               return ov)))
		 (when ov
                   (delete-overlay ov)))
               ;; and save new fragment
               (setq kk/org-latex-fragment-last begin)))

            ;; were on a fragment and now are not on a fragment
            ((and
              ;; not on a fragment now
              (not begin)
              ;; but we were on one
              kk/org-latex-fragment-last)
             ;; put image back on, provided that there is still a fragment here.
             (save-excursion
               (goto-char kk/org-latex-fragment-last)
               (when (kk/org-in-latex-fragment-p) (org-preview-latex-fragment)))

             ;; unset last fragment
             (setq kk/org-latex-fragment-last nil))

            ;; were not on a fragment, and now are
            ((and
              ;; we were not one one
              (not kk/org-latex-fragment-last)
              ;; but now we are
              begin)
             ;; remove image
             (save-excursion
               (goto-char begin)
               (let ((ov (loop for ov in (org--list-latex-overlays)
                               if
                               (and
				(<= (overlay-start ov) (point))
				(>= (overlay-end ov) (point)))
                               return ov)))
		 (when ov
                   (delete-overlay ov))))
             (setq kk/org-latex-fragment-last begin))))))

(provide 'init-org)

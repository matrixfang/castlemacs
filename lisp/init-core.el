
;;禁止emacs一个劲的叫
(setq visible-bell t);
;;不闪屏
(setq ring-bell-function 'ignore)
;; fringe settings
(set-face-attribute 'fringe nil :background nil :foreground nil)
;;(fringe-mode '(8 . 0))

(provide 'init-core)

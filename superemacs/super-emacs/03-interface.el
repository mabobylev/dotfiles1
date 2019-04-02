;;Change title-bar text
(setq frame-title-format
      "Super-emacs: %b")
;;Disable menu-bar
(menu-bar-mode -1)
;;Disable tool-bar
(tool-bar-mode -1)
;;Disable scroll-bar
(scroll-bar-mode -1)
;;Set font
;(custom-set-faces
; '(default ((t (:height 130 :family "Ubuntu Mono")))))
(setq font-use-system-font t)

(set-frame-size (selected-frame) 120 35)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq use-dialog-box nil)
(setq redisplay-dont-pause t)

(set-default 'cursor-type 'hbar)
(column-number-mode t)
(global-hl-line-mode t)
(global-visual-line-mode t)
;(windmove-default-keybindings)

;; Themes and indicates
;;Activate overcast theme
;(load-theme 'overcast t)
(load-theme 'monokai t)
(fringe-mode '(8 . 0))

;; Плавный скроллинг
;(setq scroll-step 1) ;; вверх-вниз по 1 строке
;(setq scroll-margin 10) ;; сдвигать буфер когда курсор в 10 шагах от границы
;(setq scroll-conservatively 10000)

;;; meta-presenter-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "meta-presenter" "meta-presenter.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from meta-presenter.el

(autoload 'meta-presenter-start-presentation "meta-presenter" "\
Starts presentation mode

\(fn)" t nil)

(autoload 'meta-presenter-move-to-next-slide "meta-presenter" "\
Moves to the next slide

\(fn)" t nil)

(autoload 'meta-presenter-move-to-previous-slide "meta-presenter" "\
Moves to the previous slide

\(fn)" t nil)

(autoload 'meta-presenter-reload-current-slide "meta-presenter" "\
Reloads current slide

\(fn)" t nil)

(autoload 'meta-presenter-mode "meta-presenter" "\
Toggle meta-presenter-mode

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meta-presenter" '("meta-presenter-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; meta-presenter-autoloads.el ends here

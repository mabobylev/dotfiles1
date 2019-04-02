(defun super-emacs-reload-current-file ()
  "Reload the file loaded in current buffer from the disk"
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

;;Disable splash message, start *scratch* buffer by default
(setq initial-buffer-choice 
      t)
(setq initial-scratch-message 
      "")

;;Enforce spaces for indentation, instead of tabs
(setq-default indent-tabs-mode 
              nil)

;;Enable show-paren-mode
(show-paren-mode)
(setq-default show-paren-delay 0
              show-paren-style 'parenthesis)

;;Enable winner-mode
(winner-mode t)

;;Enable windmove
(windmove-default-keybindings)

(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode t)
;;(setq word-wrap -1)

;; Подстветка кода
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Настройка отступов
(setq-default indent-tabs-mode nil) ;; отключить отступы TAB'ом
(setq-default tab-width 4) ;; ширина табуляции 4 пробела
(setq-default c-basic-offset 4)
(setq-default standard-indent 4) ;; станд. ширина отступа
(setq-default lisp-body-indent 4) ;; сдвигать LISP выражения на 4 пробела
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии ENTER перевести каретку и сделать отступ
(setq lisp-indent-function 'common-lisp-indent-function)

;; Укорачиваем сообщения в минибуфере
(defalias 'yes-or-no-p 'y-or-n-p)

;; Настройка пустых строк в конце буфера
;;(setq require-final-newline t) ;; добавить новую пустую строку в конец файла
(setq next-line-add-newlines nil) ;; не добавлять новую строку в конец при смещении

;; Выделять результаты поиска
(setq search-highlight t)
(setq query-replace-highlight t)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

(electric-pair-mode 1) ;; автозакрытие скобок с переводом курсора внутрь
(electric-indent-mode -1) ;; отключить индентацию electric mod'ом
(delete-selection-mode t)

;;Show CSS Color Values
(defun xah-syntax-color-hex ()
;"Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
;URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
;Version 2017-03-12"
    (interactive)
    (font-lock-add-keywords
     nil
     '(("#[[:xdigit:]]\\{3\\}"
        (0 (put-text-property
            (match-beginning 0)
            (match-end 0)
            'face (list :background
                        (let* (
                               (ms (match-string-no-properties 0))
                               (r (substring ms 1 2))
                               (g (substring ms 2 3))
                               (b (substring ms 3 4)))
                            (concat "#" r r g g b b))))))
       ("#[[:xdigit:]]\\{6\\}"
        (0 (put-text-property
            (match-beginning 0)
            (match-end 0)
            'face (list :background (match-string-no-properties 0)))))))
    (font-lock-flush))

(add-hook 'css-mode-hook 'xah-syntax-color-hex)
(add-hook 'php-mode-hook 'xah-syntax-color-hex)
(add-hook 'html-mode-hook 'xah-syntax-color-hex)

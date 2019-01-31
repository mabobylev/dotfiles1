(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/")
	     t)
;(add-to-list 'package-archives
;	     '("marmalade" . "http://marmalade-repo.org/packages/")
;	     t)
(package-initialize)

(set-language-environment 'UTF-8)
(setq font-use-system-font t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)
(setq use-dialog-box nil)
(setq x-select-enable-clipboard t)
(setq make-auto-save-file-name nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq search-highlight t)
(setq query-replace-highlight t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)
(set-frame-size (selected-frame) 100 30)
(fringe-mode '(8 . 0))
(setq word-wrap -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar) ;; меняем форму курсора на _
(savehist-mode t)
(delete-selection-mode t)
(setq next-line-add-newlines 1) ;; добавлять новую строку в конце

                                        ; Настройки отступов
(setq-default indent-tabs-mode 1) ; включить выставление отступов TAB'ом
;(setq-default tab-width 4) ; ширина табуляции
;(setq-default c-basic-offset 4)
;(setq-default standard-indent 4) ; стандартный отступ 4 пробела
;(setq-default lisp-body-indent 4) ; сдвигать Lisp-выражения на 4 пробела
(global-set-key (kbd "RET") 'newline-and-indent) ; по Enter'у перевести каретку и сделать отступ
(setq lisp-indent-function 'common-lisp-indent-function)

					; Плавный скроллинг
(setq scroll-step 1)
(setq scroll-margin 10)
(setq scroll-conservatively 10000)

                                        ; Linum
;; Настройка нумерации строк
;(require 'linum)
;(global-linum-mode t) ;; глобальная нумерация строк во всех буферах
(line-number-mode t) ;; показать номер строки в mode-line
(column-number-mode t) ;; показать номер столбца в mode-line
;(setq linum-format " %d") ;; задаем формат нумерации
(require 'nlinum)
(line-number-mode t)
(global-nlinum-mode t)

(electric-pair-mode t) ;; автозакрытие скобок с переводом курсора внутрь
(electric-indent-mode t) ;; включить индентацию

(show-paren-mode t) ;; включить выделение выражений между скобками
(setq-default show-paren-delay 0
              show-paren-style 'parenthesis)
;(setq show-paren-style 'expression)

(global-hl-line-mode) ;; подсветка строки
(global-auto-revert-mode t)

(global-visual-line-mode t)
(winner-mode t) ;; управление окнами
(windmove-default-keybindings)

                                        ; Buffer Selection and ibuffer settings

(require 'bs)
(require 'ibuffer)
(defalias 'list-buffer 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f5>") 'bs-show) ;; запуск buffer selection по <F5>
(global-set-key (kbd "C-S-<up>") 'buf-move-up)
(global-set-key (kbd "C-S-<down>") 'buf-move-down)
(global-set-key (kbd "C-S-<left>") 'buf-move-left)
(global-set-key (kbd "C-S-<right>") 'buf-move-right)

                                        ; Org-mode settings

(require 'org) ;; вызов org-mode
(global-set-key "\C-ca" 'org-agenda) ;; определение клавиатурных комбинаций для
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode)) ;; ассоциируем файлы *.org с org-mode

;; Перемещение между split'ами комбинацией M-arrow-keys (кроме org-mode)
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

                                        ; IDO plugin
;; Интерактивный поиск и открытие файлов
(require 'ido)
(ido-mode t)
(icomplete-mode t)
(ido-everywhere t)
(setq ido-virtual-buffers t)
(setq ido-enable-flex-matching t)

                                        ; Smex

;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;(global-set-key (kbd "C-M-z") 'switch-window)

					; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffer-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

					;Ace
(global-set-key (kbd "C-;") 'ace-window)
(global-set-key (kbd "C->") 'ace-jump-mode)
(global-set-key (kbd "C-<") 'ace-jump-mode-pop-mark)


					;Anykey
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-M-z") 'switch-window)
(global-set-key (kbd "C-\,") 'neotree-toggle)


                                        ; Imenu
(require 'imenu)
(setq imenu-auto-rescan t) ;; автообновление списка функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu по F6

                                        ; Настройка автодополнения кода (текста)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start t)
(setq ac-auto-complete-mode t)
(require 'yasnippet )
(yas-global-mode t)

                                        ; Настройка автозакрытия скобок
;(autopair-global-mode t) ;уже есть electric-mode

                                        ; Настройка отмены действий
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-visualize)

                                        ; Мультикурсор
(global-set-key (kbd "C-}") 'mc/mark-next-like-this)
(global-set-key (kbd "C-{") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-|") 'mc/mark-all-like-this)

                                        ; Настройка темы и оформления
(load-theme 'monokai t)

(require 'alpha)
(global-set-key (kbd "C-M-)") 'transparency-increase)
(global-set-key (kbd "C-M-(") 'transparency-decrease)

                                        ; Настройка подсветки синтаксиса
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

                                        ; Настройка строки состояния
(powerline-center-theme)
(setq powerline-default-separator 'wave)

; Удалить пробелы в конце строк, заменить TAB'ы пробелами и выровнять
;(defun format-current-buffer()
;    (indent-region (point-min) (point-max)))
;(defun untabify-current-buffer()
;    (if (not indent-tabs-mode)
;        (untabify (point-min) (point-max)))
;    nil)
;(add-to-list 'write-file-functions 'format-current-buffer)
;(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;;Declare a list of required packages
(defvar super-emacs--required-packages
  '(helm
    multiple-cursors
    ace-jump-mode
    ace-window
    sublimity
    powerline
    buffer-move
    auto-complete
    ztree
    undo-tree
    neotree
    dired-launch
    which-key
    monokai-theme
    overcast-theme
    meta-presenter
    myterminal-controls
    theme-looper))

;;Install required packages
(mapc (lambda (p)
        (package-install p))
      super-emacs--required-packages)

;;Configure and enable sublimity-mode
(require 'sublimity-scroll)
(sublimity-mode)

;;Load default auto-complete configs
(ac-config-default)
(setq ac-auto-start t)
(setq ac-auto-show-menu t)
(global-auto-complete-mode t)

;;Start undo-tree
(global-undo-tree-mode)

;;Set hooks for dired-launch-mode
(add-hook 'dired-mode-hook
          'dired-launch-mode
          'dired-recursive-deletes 'top)

;;Start which-key-mode
(which-key-mode)

;;Set up ace-jump-mode
(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)

;;Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'wave)

;;Configure theme-looper
(theme-looper-set-theme-set '(deeper-blue
                              wheatgrass
                              wombat
                              monokai
                              overcast))
(theme-looper-set-customizations 'powerline-reset)

;;Configure myterminal-controls
(myterminal-controls-set-controls-data
 '(("t" "Change color theme" theme-looper-enable-next-theme)
   ("r" "Reload file" super-emacs-reload-current-file)))

;;Set up helm-mode
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-split-window-in-side-p
      t)

;; Linum plugin
;(require 'linum) ;; вызов Linum
(line-number-mode t) ;; показать номер строки в mode-line
(global-linum-mode t) ;; показать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

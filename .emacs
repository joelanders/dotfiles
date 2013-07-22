(if window-system
    (tool-bar-mode -1))
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'linum)
(global-linum-mode 1)

;(helm-mode 1)
(projectile-global-mode)

;(add-to-list 'load-path "~/.emacs.d/helm")
;(require 'helm-config)

(require 'undo-tree)

(add-to-list 'custom-theme-load-path "~/.emacs.d/solarized")
(add-to-list 'load-path "~/.emacs.d/solarized")

;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)

(ido-mode 1)
(winner-mode 1)

(global-set-key (kbd "C-o") 'other-window)
(define-key Buffer-menu-mode-map (kbd "C-o") 'other-window)

(global-set-key (kbd "C-0") 'other-frame)

(global-set-key (kbd "C-M-n") (lambda () (interactive) (next-line 10)))
(global-set-key (kbd "C-M-p") (lambda () (interactive) (previous-line 10)))

(global-set-key (kbd "M-w") (lambda () (interactive) (scroll-up 10)))
;(global-set-key (kbd "C-M-w") (lambda () (interactive) (scroll-up 20)))
(global-set-key (kbd "M-q") (lambda () (interactive) (scroll-down 10)))

(global-set-key (kbd "M-a") 'beginning-of-line)
(global-set-key (kbd "M-e") 'end-of-line)

(global-set-key (kbd "C-M-f") (lambda () (interactive) (forward-char 20)))
(global-set-key (kbd "C-M-b") (lambda () (interactive) (backward-char 20)))

;(global-set-key (kbd "M-h") 'backward-char)
;(global-set-key (kbd "M-l") 'forward-char)
;(global-set-key (kbd "M-j") 'next-line)
;(global-set-key (kbd "M-k") 'previous-line)

(global-set-key (kbd "C-,") 'undo-tree-undo)
(global-set-key (kbd "C-.") 'undo-tree-redo)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-/") 'help-command)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("482215b493a4b8608dc2336c855a4bfe30a436d5c6d8ebd017a69eccf87bd03e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-light t)

(add-to-list 'load-path "~/.emacs.d/ace-jump-mode")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(set-face-foreground 'mode-line "#dc322f")

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

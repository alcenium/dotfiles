; Set system's custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

; Disable certain modes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

; Autosave configurations
(setq backup-directory-alist '(("." . "~/.trash/"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

; Add melpa to package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

; My package list
(setq package-list '(
		     company evil gruvbox-theme general))

; Install packages that aren't installed
(unless package-archive-contents (package-refresh-contents))
(dolist (package package-list)
  (unless
      (package-installed-p package) (package-install package)))

; Load gruvbox theme
(load-theme 'gruvbox-dark-soft)

; Enable evil mode
(require 'evil)
(evil-mode 1)

; Fix screen issue
(setq frame-resize-pixelwise t)

; My keymap
(define-key evil-normal-state-map (kbd "<SPC>") nil)
  (define-key evil-normal-state-map (kbd "<SPC>xf") 'find-file)
  (define-key evil-normal-state-map (kbd "<SPC>xs") 'save-buffer)
  (define-key evil-normal-state-map (kbd "<SPC>xk") 'kill-buffer)
  (define-key evil-normal-state-map (kbd "<SPC>xe") 'eval-last-sexp)
  (define-key evil-normal-state-map (kbd "<SPC>xc") 'save-buffers-kill-terminal)

  (define-key evil-normal-state-map (kbd "<SPC>xo") 'other-window)
  (define-key evil-normal-state-map (kbd "<SPC>x0") 'delete-window)
  (define-key evil-normal-state-map (kbd "<SPC>x1") 'delete-other-windows)
  (define-key evil-normal-state-map (kbd "<SPC>x2") 'split-window-below)
  (define-key evil-normal-state-map (kbd "<SPC>x3") 'split-window-right)

  (define-key evil-normal-state-map (kbd "<SPC>x50") 'delete-frame)
  (define-key evil-normal-state-map (kbd "<SPC>x52") 'make-frame-command)

(define-key evil-motion-state-map (kbd "<SPC>") nil)
  (define-key evil-motion-state-map (kbd "<SPC>xk") 'kill-buffer)
  (define-key evil-motion-state-map (kbd "<SPC>xc") 'save-buffers-kill-terminal)

  (define-key evil-motion-state-map (kbd "<SPC>xo") 'other-window)
  (define-key evil-motion-state-map (kbd "<SPC>x0") 'delete-window)
  (define-key evil-motion-state-map (kbd "<SPC>x1") 'delete-other-windows)
  (define-key evil-motion-state-map (kbd "<SPC>x2") 'split-window-below)
  (define-key evil-motion-state-map (kbd "<SPC>x3") 'split-window-right)

  (define-key evil-motion-state-map (kbd "<SPC>x50") 'delete-frame)
  (define-key evil-motion-state-map (kbd "<SPC>x52") 'make-frame-command)

(require 'dired)
  (define-key dired-mode-map (kbd "<SPC>") nil)
    (define-key dired-mode-map (kbd "<SPC>xk") 'kill-buffer)
    (define-key dired-mode-map (kbd "<SPC>xf") 'find-file)
    (define-key dired-mode-map (kbd "<SPC>xc") 'save-buffers-kill-terminal)

    (define-key dired-mode-map (kbd "<SPC>xo") 'other-window)
    (define-key dired-mode-map (kbd "<SPC>x0") 'delete-window)
    (define-key dired-mode-map (kbd "<SPC>x1") 'delete-other-windows)
    (define-key dired-mode-map (kbd "<SPC>x2") 'split-window-below)
    (define-key dired-mode-map (kbd "<SPC>x3") 'split-window-right)

(require 'company)
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)

; Enable company-mode
(add-hook 'after-init-hook 'global-company-mode)
; QOL for company
(setq company-minimum-prefix-length 1
      company-idle-delay 0.2
      company-selection-wrap-around t)
(company-tng-configure-default)

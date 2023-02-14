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

; Company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

; QOL for company
(setq company-minimum-prefix-length 1
      company-idle-delay 0.2
      company-selection-wrap-around t)
(company-tng-configure-default)

; My keymap
(require 'general)

(general-create-definer my-leader-def
  :prefix "<SPC>")

(my-leader-def
 :keymaps '(evil-normal-state-map evil-motion-state-map)
  ""      nil
  "xf"    'find-file
  "xs"    'save-buffer
  "xk"    'kill-buffer
  "xe"    'eval-last-sexp
  "xc"    'save-buffers-kill-terminal

  "xo"    'other-window
  "x0"    'delete-window
  "x1"    'delete-other-windows
  "x2"    'split-window-below
  "x3"    'split-window-right

  "h?"    'help-for-help
  "hk"    'describe-key
  "hv"    'describe-variable
  "hf"    'describe-function
  "hb"    'describe-bindings
  "hm"    'describe-mode

  "x50"   'delete-frame
  "x52"   'make-frame-command)

(general-define-key
 :keymaps 'company-active-map
  "C-j" 'company-select-next
  "C-k" 'company-select-previous)

(general-define-key 
 :keymaps 'dired-mode-map
  "<SPC>" nil
  "<SPC>xk" 'kill-buffer
  "<SPC>xo" 'other-window
  "<SPC>x0" 'delete-window
  "<SPC>x1" 'delete-other-windows
  "<SPC>x2" 'split-window-below
  "<SPC>x3" 'split-window-right

  "<SPC>x50" 'delete-frame
  "<SPC>x52" 'make-frame-command)

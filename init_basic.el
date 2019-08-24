;;;
;;
;;emacs basic config
;;
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directories-alist '(("" . ".emacs.d/backup")))

(defun my-c-mode-hook()
  (setq default-tab-width 4)
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq c-default-style "linux"))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-hook)

(if (display-graphic-p)
    (setq initial-frame-alist
	  '((tool-bar-lines . 0)
	    (left . 1250) (top . 50)
	    (width . 150) (height . 70)
	    (background-color . "#FEFAAA"))))
(setq default-frame-alist initial-frame-alist)
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))
(global-linum-mode t)
(setq column-number-mode t)
(setq-default cursor-type 'bar)

(global-hl-line-mode t)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(setq inhibit-startup-message 0)

(require 'company)
(setq global-company-mode t)
(setq company-idle-delay 0.05)
(add-hook 'after-init-hook 'global-company-mode)

(require 'yasnippet)
(yas-global-mode 1)

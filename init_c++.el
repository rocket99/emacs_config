;;;
;;;


;;(require 'company)
;;(add-hook 'c-mode-hook 'global-company-mode)
;;(add-hook 'c++-mode-hook 'global-company-mode)


;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;(add-hook 'c-mode-hook 'flycheck-mode)
;;(add-hook 'c++-mode-hook 'flycheck-mode)
;;(add-hook 'c++-mode-hook
;;	  (lambda () (setq flycheck-clang-include-path
;;			  (list (expand-file-name "$(VULKAN_SDK)/include")))))


;;(require 'ccls)
;;(require 'lsp-mode)
;;(add-hook 'c++-mode-hook #'lsp)
;;(add-hook 'c-mode-hook #'lsp)
;;(add-hook 'objc-mode-hook #'lsp)
;;(add-hook 'python-mode-hook #'lsp)
;;(setq lsp-enable-snippet nil)

(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c [") 'hs-hide-block)
	    (local-set-key (kbd "C-c ]") 'hs-show-block)
	    (local-set-key (kbd "C-c {") 'hs-hide-all)
	    (local-set-key (kbd "C-c }") 'hs-show-all)))
(add-hook 'c++-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c [") 'hs-hide-block)
	    (local-set-key (kbd "C-c ]") 'hs-show-block)
	    (local-set-key (kbd "C-c {") 'hs-hide-all)
	    (local-set-key (kbd "C-c }") 'hs-show-all)))

(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-auto-guess-root t)
  :config
  (require 'lsp-clients)
  )

(use-package lsp-mode :commands lsp :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends)) ;; add company-lsp as a backend

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "/home/sky/Github/ccls/Release/ccls")
  (setq ccls-args '("--log-file=/tmp/ccls.log"))
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

;;(require 'company-lsp)
;;(push 'company-lsp company-backends)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(use-package lsp-mode
  :commands lsp
  :hook ((c-mode c++-mode objc-mode) . lsp))

(require 'lsp-ui-flycheck)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))

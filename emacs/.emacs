(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight bold :height 128 :width normal)))))
(setq py-install-directory "~/python-mode.el-6.1.3")
  (add-to-list 'load-path py-install-directory)
  (require 'python-mode)
;;(define-key function-key-map [return] [?\C-j])
(add-hook 'java-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))
(global-linum-mode t)
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;;(load-file "~/emacs-for-python/epy-init.el")
;;(setq skeleton-pair nil)

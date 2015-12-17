(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes (quote ("6998bd3671091820a6930b52aab30b776faea41449b4246fdce14079b3e7d125" "8e7ca85479dab486e15e0119f2948ba7ffcaa0ef161b3facb8103fb06f93b428" "8c75217782ccea7e9f3ad2dae831487a5fb636d042263d0a0e0438d551da3224" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default)))
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
;;(require 'powerline)
;;(powerline-center-theme)

(setq airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)
(require 'airline-themes)
(load-theme 'airline-light)

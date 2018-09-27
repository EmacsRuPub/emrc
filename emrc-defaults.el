;;; emrc-defaults.el --- Metapackage for some defaults and a couple of packages  -*- lexical-binding: t -*-

;; Homepage: https://github.com/a13/emacs.d
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.2") (use-package "2.0") (iqa) (exec-path-from-shell) (sudo-edit))

;;; Commentary:
;;; Code:

(use-package emacs
  :ensure nil
  :init
  (put 'narrow-to-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  :custom
  (scroll-step 1)
  (inhibit-startup-screen t "Don't show splash screen")
  (use-dialog-box nil "Disable dialog boxes")
  (enable-recursive-minibuffers t "Allow minibuffer commands in the minibuffer")
  (indent-tabs-mode nil "Don't indent with tabs.")
  (debug-on-quit nil))

(use-package files
  :ensure nil
  :hook
  (before-save . delete-trailing-whitespace)
  :custom
  (require-final-newline t)
  ;; backup settings
  (backup-by-copying t)
  ;; (backup-directory-alist
  ;;  '(("." . "~/.cache/emacs/backups")))
  (delete-old-versions t)
  (kept-new-versions 6)
  (kept-old-versions 2)
  (version-control t))

(use-package autorevert
  :ensure nil
  :diminish auto-revert-mode)

(use-package iqa
  :config
  (iqa-setup-default))

(use-package cus-edit
  :ensure nil
  :custom
  ;; alternatively, one can use `(make-temp-file "emacs-custom")'
  (custom-file null-device "Don't store customizations"))

(use-package epa
  :ensure nil
  :custom
  (epg-gpg-program "gpg")
  (epa-pinentry-mode nil))

(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'forward))

(use-package tramp
  :ensure nil
  :custom
  (tramp-backup-directory-alist backup-directory-alist)
  (tramp-default-method "ssh")
  (tramp-default-proxies-alist nil))

(use-package sudo-edit
  :bind (:map ctl-x-map
              ("M-s" . sudo-edit)))

(use-package frame
  :ensure nil
  ;; disable suspending on C-z
  :bind
  ("C-z" . nil))

(use-package delsel
  :ensure nil
  ;; C-c C-g always quits minubuffer
  :bind
  (:map mode-specific-map
        ("C-g" . minibuffer-keyboard-quit)))

(use-package simple
  :ensure nil
  :diminish
  ((visual-line-mode . " ↩")
   (auto-fill-function . " ↵"))
  :config
  (column-number-mode t)
  (toggle-truncate-lines 1)
  :bind
  ;; remap ctrl-w/ctrl-h
  (("C-w" . backward-kill-word)
   ("C-h" . delete-backward-char)
   :map ctl-x-map
   ("C-k" . kill-region)
   :map mode-specific-map
   ("h" . help-command)))

(use-package ibuffer
  :ensure nil
  :bind
  ([remap list-buffers] . ibuffer))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Local Variables:
;; eval: (add-hook 'after-save-hook (lambda ()(org-babel-tangle)) nil t)
;; End:

(provide 'emrc-defaults)
;;; emrc-defaults.el ends here

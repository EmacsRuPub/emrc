;;; emrc-dired.el --- Metapackage for eshell-related stuff   -*- lexical-binding: t -*-

;; Homepage: https://github.com/a13/emacs.d
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.2") (use-package "2.0"))
;; Package-Requires: ((dired-toggle "0.1") (dired-hide-dotfiles "0.1") (dired-fl "0") (async "1.9.3") (dired-rsync "0.5") (dired-launch "0.2"))
;;; Commentary:
;;; Code:

(use-package ls-lisp
  :ensure nil
  :custom
  (ls-lisp-emulation 'MS-Windows)
  (ls-lisp-ignore-case t)
  (ls-lisp-verbosity nil))

(use-package dired
  :ensure nil
  :custom (dired-dwim-target t "guess a target directory")
  :hook
  (dired-mode . dired-hide-details-mode))

(use-package dired-x
  :ensure nil
  :bind
  ([remap list-directory] . dired-jump)
  :custom
  ;; do not bind C-x C-j since it's used by jabber.el
  (dired-bind-jump nil))

(use-package dired-toggle)

(use-package dired-hide-dotfiles
  :bind
  (:map dired-mode-map
        ("." . dired-hide-dotfiles-mode))
  :hook
  (dired-mode . dired-hide-dotfiles-mode))

(use-package diredfl
  :hook
  (dired-mode . diredfl-mode))

(use-package async
  :init
  (dired-async-mode t))

(use-package dired-rsync
  :bind
  (:map dired-mode-map
        ("r" . dired-rsync)))

(use-package dired-launch)

;; Local Variables:
;; eval: (add-hook 'after-save-hook (lambda ()(org-babel-tangle)) nil t)
;; End:

(provide 'emrc-dired)
;;; emrc-dired.el ends here

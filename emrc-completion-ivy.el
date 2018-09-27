;;; emrc-completion-ivy.el --- Metapackage for minibuffer autocompletion packages  -*- lexical-binding: t -*-

;; Homepage: https://github.com/a13/emacs.d
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.2") (use-package "2.0"))
;; Package-Requires: ((smex "3.0") (ivy-xref "0.1") (counsel "0.10.0") (swiper "0.10.0") (counsel-world-clock "0.2.1") (ivy-rich "0.1.0"))

;;; Commentary:
;;; Code:

;; counsel-M-x can use this one
(use-package smex)

(use-package ivy
  :diminish ivy-mode
  :custom
  ;; (ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-count-format "%d/%d " "Show anzu-like counter")
  (ivy-use-selectable-prompt t "Make the prompt line selectable")
  :custom-face
  (ivy-current-match ((t (:inherit 'hl-line))))
  :bind
  (:map mode-specific-map
        ("C-r" . ivy-resume))
  :config
  (ivy-mode t))

(use-package ivy-xref
  :custom
  (xref-show-xrefs-function #'ivy-xref-show-xrefs "Use Ivy to show xrefs"))

(use-package counsel
  :bind
  (([remap menu-bar-open] . counsel-tmm)
   ([remap insert-char] . counsel-unicode-char)
   ([remap isearch-forward] . counsel-grep-or-swiper)
   :map mode-specific-map
   :prefix-map counsel-prefix-map
   :prefix "c"
   ("a" . counsel-apropos)
   ("b" . counsel-bookmark)
   ("d" . counsel-dired-jump)
   ("e" . counsel-expression-history)
   ("f" . counsel-file-jump)
   ("g" . counsel-org-goto)
   ("h" . counsel-command-history)
   ("i" . counsel-imenu)
   ("l" . counsel-locate)
   ("m" . counsel-mark-ring)
   ("o" . counsel-outline)
   ("p" . counsel-package)
   ("r" . counsel-recentf)
   ("s g" . counsel-grep)
   ("s r" . counsel-rg)
   ("s s" . counsel-ag)
   ("t" . counsel-org-tag)
   ("v" . counsel-set-variable)
   ("w" . counsel-wmctrl))
  :init
  (counsel-mode))

(use-package swiper)

;; Not sure if we really need this one
(use-package counsel-world-clock
  :bind
  (:map counsel-prefix-map
        ("c" .  counsel-world-clock)))

(use-package ivy-rich
  :custom
  (ivy-rich-switch-buffer-name-max-length 60 "Increase max length of buffer name.")
  :config
  (ivy-rich-mode 1))

;; Local Variables:
;; eval: (add-hook 'after-save-hook (lambda ()(org-babel-tangle)) nil t)
;; End:

(provide 'emrc-completion-ivy)
;;; emrc-completion-ivy.el ends here

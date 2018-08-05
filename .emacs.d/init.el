(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 '("melpa-stable" . "https://stable.melpa.org/packages/")
 )

(defvar my-packages
  '(better-defaults
    monokai-theme
    elpy
    yasnippet
    yasnippet-snippets
    smex
    exec-path-from-shell
    flycheck
    js2-mode
    json-mode
    magit
    markdown-mode
    markdown-preview-mode
    py-autopep8
    rainbow-delimiters
    smart-mode-line
    web-mode
    yaml-mode
    url
    auto-complete
    company
    neotree
    avy
    key-chord
    multiple-cursors
    smartparens
    git-gutter
    terraform-mode
    vue-mode
    web-mode))

(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (markdownfmt multiple-cursors key-chord avy neotree auto-complete yaml-mode web-mode smart-mode-line rainbow-delimiters py-autopep8 elpy magit)))
 '(python-shell-interpreter "/home/scott/anaconda3/bin/python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'smartparens-config)

(global-set-key (kbd "M-1") 'linum-mode)

(load-theme 'monokai t)

(elpy-enable)

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))

(require 'markdown-preview-mode)

(provide '_markdown)

;; avy
(require 'avy)
(avy-setup-default)
;; (global-set-key (kbd "M-") 'avy-goto-char)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(require 'better-defaults)

(show-paren-mode 1)

;; TODO Add yaml config
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)

(setq inhibit-startup-message t
      yas-global-mode 1
      column-number-mode t)
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "/home/scott/anaconda3/bin/python3")

(require 'multiple-cursors)
(global-set-key (kbd "C-q") 'mc/mark-next-like-this)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'git-gutter)
(global-git-gutter-mode t)

(require 'avy)
(avy-setup-default)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

(require 'smex)

(global-set-key (kbd "C-]") 'beginning-of-buffer)
(global-set-key (kbd "C-\\") 'end-of-buffer)



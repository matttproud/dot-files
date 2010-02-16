;; Add a git packages to the search path.
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/git-emacs-1.1"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/vc-git"))

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/emacs-rails"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/mmm-mode-0.4.8"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/color-theme-6.6.0"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/g-client"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party/emacs-nav-16"))

(require 'color-theme)
(color-theme-initialize)

(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(autoload 'ion3-mode "ion3" "Major mode to edit ion3 config files" t)

;; Minor mode to support multiple major modes.
;; (require 'mmm-mode)
;; (require 'mmm-auto)

;; Load the git packages.
;; (require 'git-emacs)

;; (if (string= (substring emacs-version 0 2) "21")
;;    (message "Not loading Rail extensions.") (require 'rails))

(require 'column-marker)

;; (load-library "g")
;; (require 'g)

(require 'window-number)
(window-number-mode)

;; (require 'frame-cmds)
(require 'dot-mode)
(add-hook 'find-file-hook 'dot-mode-on)

(require 'nav)

(require 'python-mode)

(require 'linum)
(global-linum-mode 1)

(provide 'third-party)

;; Add additional search paths.
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp-personal"))

;; Load software from other sources.
(require 'lisp)

;; Load stuff that I have authored.
(require 'personal)

(put 'erase-buffer 'disabled nil)

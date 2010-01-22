;; -*- mode: lisp -*-

;; Add additional search paths.
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp-personal"))

;; Load software from other sources.
(require 'third-party)

;; Load stuff that I have authored.
(require 'personal)

(put 'erase-buffer 'disabled nil)

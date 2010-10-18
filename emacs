;; -*- mode: lisp -*-

;; Add additional search paths.
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/personal"))

;; Load software from other sources.
(load-file "~/.emacs.d/third-party/third-party.el")

;; Load stuff that I have authored.
(load-file "~/.emacs.d/personal/personal.el")

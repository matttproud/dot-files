;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Matt T. Proud's UNIX Dot (.) Files and Configurations                        ;
;                                                                              ;
; You are free to use these as you wish, except for I request that you provide ;
; attribution as well as a canonical link back to their source.                ;
;                                                                              ;
; - http://www.matttproud.com                                                  ;
; - http://blog.matttproud.com                                                 ;
; - https://github.com/matttproud                                              ;
;                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; -*- mode: lisp -*-

(defun trace-enter (f) (message (format "Entering %s..." f)))
(defun trace-exit (f) (message (format "Exiting %s..." f)))

(trace-enter ".emacs")

;; Add additional search paths.
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/personal"))

;; Load software from other sources.
(load-file "~/.emacs.d/third-party/third-party.el")

;; Load stuff that I have authored.
(load-file "~/.emacs.d/personal/personal.el")

(trace-exit ".emacs")
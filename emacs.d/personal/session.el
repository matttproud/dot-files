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

(trace-enter "session.el")

(require 'desktop)

(setq desktop-load-locked-desktop t ; Always load the locked desktop.
      desktop-save t ; Always save the desktop, no matter what state the file
                     ; was last in.
      desktop-dirname "~/.emacs.d/desktop"
      desktop-base-file-name "emacs.desktop"
      desktop-base-lock-name "lock"
      desktop-path (list desktop-dirname))

(desktop-save-mode t)

(require 'midnight)


(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

(provide 'session)

(trace-exit "session.el")

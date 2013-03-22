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

(trace-enter "display.el")

(if window-system
    (load-theme 'solarized-dark t)
  (load-theme 'solarized-light t))


;; Highlight selections.
(setq transient-mark-mode t)

;; Show line number.
(setq line-number-mode t)

;; Show column position.
(setq column-number-mode t)

(require 'scroll-bar)
;; Disable scrollbar.
(toggle-scroll-bar -1)

;; Line-wrapping at 80.
(set-default 'fill-column 80)

;; Disable beeping.
(setq visible-bell t)

;; Disable toolbar.
(tool-bar-mode -1)

;; Disable splash screen.
(setq inhibit-splash-screen t)

;; Syntax highlighting.
(global-font-lock-mode t)

;; Use high contrast color scheme, since it is easy on my eyes in X11,
;; virtual terminal, and Quartz/Cocoa/Carbon/what-ever-the-fuck-Apple-shoves-
;; down-unsuspecting-saps-throats.
;; (color-theme-high-contrast)

(setq-default cursor-type 'bar)

(show-paren-mode t)
(column-number-mode t)
(column-marker-1 80)

(make-face 'my-80-column-face)
(set-face-attribute 'my-80-column-face
                    nil
                    :foreground "yellow"
                    :background "red")

(font-lock-add-keywords
 nil
 '(("^.\\{80\\}\\(.\\)" 1 'my-80-column-face prepend)))

(provide 'display)

(trace-exit "display.el")

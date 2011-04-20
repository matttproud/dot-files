;; Highlight selections.
(setq transient-mark-mode t)

;; Show line number.
(setq line-number-mode t)

;; Show column position.
(setq column-number-mode t)

;; Disable scrollbar.
(toggle-scroll-bar -1)

;; Line-wrapping at 80.
(set-default 'fill-column 80)

;; Disable beeping.
(setq visible-bell t)

;; Disable menubar.
;; (menu-bar-mode -1)

;; Disable toolbar.
(tool-bar-mode -1)

;; Disable splash screen.
(setq inhibit-splash-screen t)

;; Syntax highlighting.
(global-font-lock-mode t)

;;(set-background-color "black")
;;(set-foreground-color "white")
; (set-face-background 'mode-line "red")
;; (set-face-foreground 'mode-line "white")

;; Emacs people!
;; (color-theme-dark-laptop)
;; (color-theme-aalto-light)

(color-theme-arjen)

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

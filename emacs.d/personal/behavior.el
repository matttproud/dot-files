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

(trace-enter "behavior.el")

;; Delete the whole line, include the carriage return.
(setq kill-whole-line t)

;; Stop at the end of the file and don't add more lines.
(setq next-line-add-newlines nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

(setq c-basic-offset 2)
(setq tab-width 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40))
(setq sh-indentation 2
      sh-basic-offset 2)

(setq-default fill-column 78)

(setq mouse-wheel-follow-mouse t)

(setq c-basic-offset 2)

(setq-default scroll-conservatively 1)

(defun copy-line ()
  "Copy the current line into the kill ring."
  (interactive)
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position 2))
  (message "Line copied."))

(defun kill-line-entirely-leaving-whitespace ()
  "Kill the whole line, regardless of position, leaving the whitepsace."
  (interactive)
  (back-to-indentation)
  (kill-line)
)

(defun kill-line-entirely ()
  "Kill the whole line, regardless of position."
  (interactive)
  (beginning-of-line)
  (kill-line))

(defun ruby-electric-curlies (argument)
  "Mocked out."
  (interactive "P")
  (self-insert-command (prefix-numeric-value argument)))

;; Remove trailing whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq auto-mode-alist
      (nconc
       (list
        (cons "\\.py$" 'python-mode))
       auto-mode-alist))

;; This preempts the built-in Python mode for the on in third-party.
(autoload 'python-mode "python-mode")

;; Start the Emacs server.
(server-start)

;; Allow shift to select text!
(setq shift-select-mode t)

;; Allow one to delete a range of selected text with delete.
(delete-selection-mode 1)

(defun goto-matching-parenthesis (arg)
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(add-hook 'python-mode-hook 'whitespace-mode)

;; No splash screen.
(setq inhibit-splash-screen t)

(put 'erase-buffer 'disabled nil)

(require 'session)

;; Enable fixed buffer windows.
(require 'dedicated)

;; Highlight the current line.
(defface hl-line '((t (:background "#a6cafe")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t)

(defun mtp-visit-from-kill-buffer ()
  "Visit a buffer named by the value of `current-kill'."
  (interactive)
  (find-file (current-kill 0)))

(setq mtp-auto-complete-modes '(go-mode makefile-mode shell-script-mode sh-mode conf-mode protobuf-mode))
(mapcar
 (lambda (x)
   (add-to-list 'ac-modes x))
 mtp-auto-complete-modes)

(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

(setenv
 "GOPATH"
 (expand-file-name "~/Development/go"))
(setenv
 "PATH"
 (concat
  (getenv "GOPATH") "/bin" ":"
  (getenv "PATH")
  ":" (expand-file-name "~/.gvm/gos/go1.0.3/bin")))
(setq
 exec-path
 (append
  exec-path
  (list
   (expand-file-name
    "~/Development/go/bin")
   (expand-file-name
    "~/.gvm/gos/go1.0.3/bin"))))
(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-autocomplete)
(require 'auto-complete-config)

(savehist-mode t)
(setq savehist-file "~/.emacs.d/savehist")

(provide 'behavior)

(trace-exit "behavior.el")

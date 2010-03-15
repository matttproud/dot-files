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

;; This is not always working and will need to be investigated.

;; (add-hook 'c++-mode-hook
;;           '(lambda () (font-lock-set-up-width-warning 80)))

;; (add-hook 'java-mode-hook
;;           '(lambda () (font-lock-set-up-width-warning 80)))

;; (add-hook 'python-mode-hook
;;           '(lambda () (font-lock-set-up-width-warning 80)))

;; (add-hook 'sh-mode
;;           '(lambda () (font-lock-set-up-width-warning 80)))

;; (add-hook 'ruby-mode
;;           '(lambda () (font-lock-set-up-width-warning 80)))

(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40))
(setq sh-indentation 2
      sh-basic-offset 2)

(setq-default fill-column 78)

(setq mouse-wheel-follow-mouse t)

(setq c-basic-offset 2)

(setq-default scroll-conservatively 1)

;;(setq x-select-enable-clipboard t)

;;(setq make-backup-files t)
;;(setq version-control t)
;;(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

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

;; Display whitespace.
;; (whitespace-mode)

(defun duplicate-line ()
  "Clone the current line."
  (interactive)
  (save-excursion
    (copy-region-as-kill (line-beginning-position) (line-end-position))
    (end-of-line)
    (newline)
    (yank)
    (current-kill 1)))

(global-set-key "\C-z" 'duplicate-line)

(provide 'behavior)

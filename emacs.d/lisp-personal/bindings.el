;; Open a list of current buffers.
(global-set-key (kbd "C-b") 'buffer-menu)

;; Open a list of recent files.
(global-set-key (kbd "C-M-r") 'recentf-open-files)

(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)

(global-set-key (kbd "C-M-k") 'kill-line-entirely)

(global-set-key (kbd "C-M-c") 'copy-line)
(global-set-key (kbd "C-M-g") 'goto-line)

(global-set-key (kbd "C-M-y") 'comment-region)
(global-set-key (kbd "C-M-u") 'uncomment-region)

;; Ensure that delete does what I expect.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(defcustom mtp-prefix nil
  "My global prefix for keymap bindings."
  :type 'sexp)

;; (defvar mtp-global-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map "n" 'next-window)
;;     (define-key map "p" 'previoux-window)
;;     map))

;; (global-set-key mtp-prefix mtp-global-map)

(provide 'bindings)

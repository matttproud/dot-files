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

(trace-enter "bindings.el")

;; Open a list of current buffers.
(global-set-key (kbd "C-x b") 'buffer-menu)

;; Open a list of recent files.
(global-set-key (kbd "C-M-r") 'recentf-open-files)
(global-set-key (kbd "C-r") 'recentf-open-files)

(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)

(global-set-key (kbd "C-X e") 'kill-line-entirely)

(global-set-key (kbd "C-x l") 'copy-line)
(global-set-key (kbd "C-M-g") 'goto-line)

(global-set-key (kbd "C-x p") 'beginning-of-defun)
(global-set-key (kbd "C-x n") 'end-of-defun)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "C-c M-c") 'recompile)

;; Ensure that delete does what I expect.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(defun mtp-revert-buffer-without-confirmation
  ()
  "Revert a buffer unconditionally"
  (interactive)
  (revert-buffer 't 't))

(global-set-key (kbd "C-c r") 'mtp-revert-buffer-without-confirmation)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)

(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-c g") 'goto-line)

(global-set-key (kbd "C-x C-v") 'mtp-visit-from-kill-buffer)

(provide 'bindings)

(trace-exit "bindings.el")

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

(trace-enter "python.el")

(defun my-python-mode-hook ()
  (setq python-indent 2) ; GNU
  (setq py-indent-offset 2) ; Third-party.
)

(add-hook 'python-mode-hook 'my-python-mode-hook)

(defun my-perl-mode-hook ()
  (interactive)
  (make-local-variable 'perl-indent-level)
  (setq perl-indent-level 2)
  (make-local-variable 'perl-continued-statement-offset)
  (setq perl-continued-statement-offset 2)
  (make-local-variable 'perl-continued-brace-offset)
  (setq perl-continued-brace-offset -2)
  (make-local-variable 'perl-label-offset)
  (setq perl-label-offset -2)
  (setq indent-tabs-mode nil))

(add-hook 'perl-mode-hook 'my-perl-mode-hook)

(defun my-sh-mode-hook ()
  (interactive)
  (make-local-variable 'sh-basic-offset)
  (setq sh-basic-offset 2)
  (setq indent-tabs-mode nil))

(add-hook 'sh-mode-hook 'my-sh-mode-hook)

(provide 'python)

(trace-exit "python.el")

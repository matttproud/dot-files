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

(trace-enter "personal.el")

(setq dependencies
     '(behavior bindings buffer bytecompile display identity
       python))

(setq hostname-components (split-string (system-name) "\\."))
(setq google-found nil)
(while hostname-components
  (setq momentary (car hostname-components))
  (print momentary)
  (setq hostname-components (cdr hostname-components))
  (if (string= momentary "google") (setq google-found t)))


(defun load-google-stuffs
  ()
  "Load Google items."
  (message "Loading Google Stuffs.")
  (setq dependencies
    (append dependencies '(google))))

(if google-found
  (load-google-stuffs))

(mapcar
 (lambda (x)
   (setq file (format "~/.emacs.d/personal/%s.el" x))
   (load-file file))
 dependencies)

(setq requires
      '(bookmark desktop))

(mapcar
 (lambda (x)
   (require x))
 requires)

(provide 'personal)

(trace-exit "personal.el")

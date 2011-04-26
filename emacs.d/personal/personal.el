(setq dependencies
      '(behavior bindings buffer bytecompile display identity javascript
        python))

(mapcar
 (lambda (x)
   (setq file (format "~/.emacs.d/personal/%s.el" x))
   (load-file file))
 dependencies)

(setq hostname-components (split-string (system-name) "\\."))
(setq google-found nil)
(while hostname-components
  (setq momentary (car hostname-components))
  (print momentary)
  (setq hostname-components (cdr hostname-components))
  (if (string= momentary "google") (setq google-found t)))

(if google-found (message "At Google."))
(if google-found (require 'google))
(provide 'personal)

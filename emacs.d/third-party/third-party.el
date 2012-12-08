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

(add-to-list 'load-path (expand-file-name "~/.emacs.d/third-party"))

(setq search-path-dependencies
      '(color-theme-6.6.0 g-client emacs-nav-16 auto-complete-1.3.1))
(mapcar
 (lambda (x)
   (setq directory (format "~/.emacs.d/third-party/%s" x))
   (setq fully-qualified-directory (expand-file-name directory))
   (message "Adding %s to search path." fully-qualified-directory)
   (add-to-list 'load-path fully-qualified-directory))
 search-path-dependencies)


(setq load-dependencies
      '(color-theme column-marker go-mode-load window-number python-mode linum
        multi-term git dedicated rainbow-delimiters powerline yaml-mode auto-complete))

(mapcar
 (lambda (x)
   (message "Loading %s." x)
   (require x))
 load-dependencies)

(color-theme-initialize)

(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(autoload 'ion3-mode "ion3" "Major mode to edit ion3 config files" t)

; Enable magic parentheses, brackets, and braces colorization.
(global-rainbow-delimiters-mode)

(window-number-mode)

; Enable buffer changing to pass through terminal app.
(add-to-list 'term-unbind-key-list "C-b")
(setq multi-term-program "/bin/bash")

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(provide 'third-party)

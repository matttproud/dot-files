;;; flymake-checkers-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (flymake-checkers-mode-off flymake-checkers-mode-on
;;;;;;  flymake-checkers-mode flymake-checkers-cleanup flymake-checkers-init)
;;;;;;  "flymake-checkers" "flymake-checkers.el" (21122 10705 0 0))
;;; Generated autoloads from flymake-checkers.el

(autoload 'flymake-checkers-init "flymake-checkers" "\
Wrap checker PROPERTIES into an init function.

PROPERTIES is the properties list describing a checker.

Use this function `apply-partially' to construct a real init
function for flymake.

\(fn)" nil nil)

(defadvice flymake-get-init-function (around flymake-checkers-get-init-function first activate compile) "\
Get the flymake checker.

Return `flymake-checkers-init-function', if `flymake-checkers-mode' is enabled." (setq ad-return-value (if flymake-checkers-mode (quote flymake-checkers-init) ad-do-it)))

(autoload 'flymake-checkers-cleanup "flymake-checkers" "\
Perform cleanup for flymake-checkers.

\(fn)" nil nil)

(defadvice flymake-get-cleanup-function (around flymake-checkers-get-cleanup-function activate compile) "\
Get the cleanup function for the current checker." (setq ad-return-value (if flymake-checkers-mode (quote flymake-checkers-cleanup) ad-do-it)))

(autoload 'flymake-checkers-mode "flymake-checkers" "\
Toggle extended on-the-fly syntax checking.

Extended on-the-fly syntax checking based on flymake, but with
easier configuration and improved checkers.

Note: Pure flymake is INCOMPATIBLE with this mode.

\(fn &optional ARG)" t nil)

(autoload 'flymake-checkers-mode-on "flymake-checkers" "\
Unconditionally enable `flymake-checkers-mode'.

\(fn)" nil nil)

(autoload 'flymake-checkers-mode-off "flymake-checkers" "\
Unconditionally disable `flymake-checkers-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("flymake-checkers-pkg.el") (21122 10705
;;;;;;  899320 0))

;;;***

(provide 'flymake-checkers-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flymake-checkers-autoloads.el ends here

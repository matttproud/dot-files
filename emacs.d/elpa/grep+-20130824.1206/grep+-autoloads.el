;;; grep+-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (grepp-toggle-comments grepp-remove-comments grepp-choose-grep-buffer
;;;;;;  grepp-new-grep-buffer grep grepp-default-regexp-fn grepp-default-comment-line-regexp)
;;;;;;  "grep+" "grep+.el" (21122 28315 0 0))
;;; Generated autoloads from grep+.el

(defvar grepp-default-comment-line-regexp ":[0-9]+: *;" "\
*Default regexp for a comment line, for use in `grepp-remove-comments'.
The default value matches lines that begin with a Lisp comment.")

(custom-autoload 'grepp-default-comment-line-regexp "grep+" t)

(defvar grepp-default-regexp-fn (if (fboundp 'non-nil-symbol-name-nearest-point) 'non-nil-symbol-name-nearest-point 'word-at-point) "\
*Function of 0 args called to provide default search regexp to \\[grep].
Some reasonable choices are defined in `thingatpt+.el':
`word-nearest-point', `non-nil-symbol-name-nearest-point',
`region-or-non-nil-symbol-name-nearest-point', `sexp-nearest-point'.

This is ignored if Transient Mark mode is on and the region is active
and non-empty.  In that case, the quoted (\") region text is used as
the default regexp.

If `grepp-default-regexp-fn' is nil and no prefix arg is given to
`grep', then no defaulting is done.

Otherwise, if the value is not a function, then function
`grepp-default-regexp-fn' does the defaulting.")

(custom-autoload 'grepp-default-regexp-fn "grep+" t)

(autoload 'grep "grep+" "\
Run `grep', with user-specified args, and collect output in a buffer.
COMMAND-ARGS are the user-specified arguments.
While `grep' runs asynchronously, you can use
\\[next-error] (M-x next-error), or \\<grep-mode-map>\\[compile-goto-error]
in output buffer `*grep*', to go to the lines where `grep' found matches.

This command uses a special history list for its COMMAND-ARGS, so you can
easily repeat a grep command.

The text (regexp) to find is defaulted as follows:

- If Transient Mark mode is on and the region is active and nonempty,
  then the double-quoted region text is used.  (If the region contains
  double-quotes (\"), then you will need to escape them by hand.)

- If option `grepp-default-regexp-fn' is a function, then it is called
  to return the default regexp.

- If `grepp-default-regexp-fn' is nil and no prefix arg is provided,
  then no default regexp is used.

If a prefix arg is provided, the default text is substituted into the
last grep command in the grep command history (or into `grep-command'
if that history list is empty).  That is, the same command options and
files to search are used as the last time.

If specified, optional second arg HIGHLIGHT-REGEXP is the regexp to
temporarily highlight in visited source lines.

\(fn COMMAND-ARGS &optional HIGHLIGHT-REGEXP)" t nil)

(defalias 'new-grep-buffer 'grepp-new-grep-buffer)

(autoload 'grepp-new-grep-buffer "grep+" "\
Rename current grep buffer and switch to new buffer *grep*.
Current buffer must be a grep buffer.  It is renamed to *grep*<N>.

\(fn)" t nil)

(defalias 'choose-grep-buffer 'grepp-choose-grep-buffer)

(autoload 'grepp-choose-grep-buffer "grep+" "\
Switch to a grep buffer.

\(fn BUF)" t nil)

(defalias 'remove-grep-comments 'grepp-remove-comments)

(autoload 'grepp-remove-comments "grep+" "\
Remove lines that are completely commented out.
With a prefix argument, you are prompted for the regexp used to match
 commented lines.  The default value is
 `grepp-default-comment-line-regexp'.
With no prefix argument, this default value is used as the regexp.

You can use command `grep-toggle-comments' to toggle automatic removal
of commented lines.

Note: This simply removes lines that begin with the regexp you
provide.  It does not, in general, remove multi-line comments.  Use it
to remove C++ comments that start with //, but not multi-line comments
between /* and */.

\(fn &optional READ-REGEXP-P)" t nil)

(defalias 'toggle-grep-comments 'grepp-toggle-comments)

(autoload 'grepp-toggle-comments "grep+" "\
Toggle removal of commented lines in grep output.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("grep+-pkg.el") (21122 28315 641734 0))

;;;***

(provide 'grep+-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; grep+-autoloads.el ends here

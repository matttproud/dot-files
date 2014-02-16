;; -*- mode: lisp -*-

;; Package Management
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Requires
(require 'graphene)
(require 'powerline)

;; Modes
(recentf-mode 1)
(ido-mode nil)
(column-number-mode)
(elpy-enable)

;; Appearance
(powerline-default-theme)
(load-theme 'solarized-dark t)

;; Key Bindings
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-M-r") 'recentf-open-files)
(global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "M-k") 'mtp-copy-line-or-region)
(global-set-key (kbd "M-K") 'mtp-cut-line-or-region)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-x r") 'revert-buffer)
(global-set-key (kbd "C-x t") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "C-c C-r") 'recompile)
(global-set-key (kbd "C-x j") 'mtp-next-line-indent)
(global-set-key (kbd "C-x i") 'mtp-indent-buffer)
(global-set-key (kbd "C-x v d") 'mtp-visit-directory-of-buffer)
(global-set-key (kbd "C-x n f") 'new-frame)
(global-set-key (kbd "C-9") 'ergoemacs-forward-open-bracket)
(global-set-key (kbd "C-0") 'ergoemacs-backward-open-bracket)

;; Behavior
(setq recentf-max-menu-items 10)
(setq visible-bell t)
;; Prevent automatic navigation to the minibuffer.
(setq minibuffer-prompt-properties
      (quote
       (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; Prevent asking for full yes and no.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Hooks
(add-hook 'python-mode-hook 'highlight-80+-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Alias
(eval-after-load "flycheck"
  '(defun flycheck-may-use-echo-area-p () nil))

;; Behavioral Functions
(defun mtp-next-line-indent () "Create a newline following the present, correctly indented."
  (interactive)
  (progn
    (move-end-of-line nil)
    (newline-and-indent)))

(defun mtp-indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun mtp-visit-directory-of-buffer ()
  (interactive)
  (find-file (file-name-directory (buffer-file-name))))

(defun mtp-copy-line-or-region ()
  "Copy current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))

(defun mtp-cut-line-or-region ()
  "Cut the current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2))))

(defun ergoemacs-forward-open-bracket (&optional number)
  "Move cursor to the next occurrence of left bracket or quotation mark.

With prefix NUMBER, move forward to the next NUMBER left bracket or quotation mark.

With a negative prefix NUMBER, move backward to the previous NUMBER left bracket or quotation mark."
  (interactive "p")
  (if (and number
           (> 0 number))
      (ergoemacs-backward-open-bracket (- 0 number))
    (forward-char 1)
    (search-forward-regexp
     (eval-when-compile
       (regexp-opt
        '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«"))) nil t number)
    (backward-char 1)))

(defun ergoemacs-backward-open-bracket (&optional number)
  "Move cursor to the previous occurrence of left bracket or quotation mark.
With prefix argument NUMBER, move backward NUMBER open brackets.
With a negative prefix NUMBER, move forward NUMBER open brackets."
  (interactive "p")
  (if (and number
           (> 0 number))
      (ergoemacs-forward-open-bracket (- 0 number))
    (search-backward-regexp
     (eval-when-compile
       (regexp-opt
	'("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«"))) nil t number)))

(defun ergoemacs-forward-close-bracket (&optional number)
  "Move cursor to the next occurrence of right bracket or quotation mark.
With a prefix argument NUMBER, move forward NUMBER closed bracket.
With a negative prefix argument NUMBER, move backward NUMBER closed brackets."
  (interactive "p")
  (if (and number
           (> 0 number))
      (ergoemacs-backward-close-bracket (- 0 number))
    (search-forward-regexp
     (eval-when-compile
       (regexp-opt '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»"))) nil t number)))

(defun ergoemacs-backward-close-bracket (&optional number)
  "Move cursor to the previous occurrence of right bracket or quotation mark.
With a prefix argument NUMBER, move backward NUMBER closed brackets.
With a negative prefix argument NUMBER, move forward NUMBER closed brackets."
  (interactive "p")
  (if (and number
           (> 0 number))
      (ergoemacs-forward-close-bracket (- 0 number))
    (backward-char 1)
    (search-backward-regexp
     (eval-when-compile
       (regexp-opt '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»"))) nil t number)
    (forward-char 1)))

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.8)
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(flycheck-check-syntax-automatically (quote (save new-line mode-enabled)))
 '(python-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

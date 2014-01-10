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

;; Key Bindings
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "C-x b") 'buffer-menu)
(global-set-key (kbd "C-M-r") 'recentf-open-files)
(global-set-key (kbd "M-x") 'execute-extended-command)
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

;; Behavior
(setq recentf-max-menu-items 10)
(setq visible-bell t)

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

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.8)
 '(flycheck-check-syntax-automatically (quote (save new-line mode-enabled)))
 '(python-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

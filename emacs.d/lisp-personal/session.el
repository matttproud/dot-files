(require 'desktop)

(desktop-save-mode t)
(require 'midnight)


(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

(provide 'session)
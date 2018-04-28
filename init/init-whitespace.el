(global-whitespace-mode 1)

(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))

(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'init-whitespace)

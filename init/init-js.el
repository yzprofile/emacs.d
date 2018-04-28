(require-package 'js2-mode)
(require-package 'js2-refactor)
(require-package 'json)
(require-package 'rjsx-mode)

(setq js-indent-level 2)


(defun prettier-eslint ()
  "Format the current file with ESLint."
  (interactive)
  (progn (call-process
          "prettier-eslint"
          nil "*Prettier-ESLint Errors*" nil
          buffer-file-name "--write" "--single-quote"
          "--trailing-comma=all" "--bracket-spacing=false")
         (revert-buffer t t t)))


(add-hook 'js-mode-hook (lambda () (add-hook 'after-save-hook 'prettier-eslint nil t)))
(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'prettier-eslint nil t)))
(add-hook 'react-mode-hook (lambda () (add-hook 'after-save-hook 'prettier-eslint nil t)))

(provide 'init-js)

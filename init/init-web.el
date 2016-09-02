(require-package 'web-mode)
(require-package 'web-beautify)
(require-package 'less-css-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(require-package 'coffee-mode)
(add-hook 'coffee-mode-hook
          (lambda ()
            (enable-whitespace)
            (custom-set-variables '(coffee-tab-width 4))
            (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
            (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)
            (add-hook 'after-save-hook 'coffee-compile-file nil t)))


(provide 'init-web)

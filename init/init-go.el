(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-projectile)
(require-package 'gotest)
(require-package 'golint)
(require-package 'go-gopath)
(require-package 'protobuf-mode)

(add-to-list 'completion-ignored-extensions ".test")

(defconst my-protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook
          (lambda () (c-add-style "my-style" my-protobuf-style t)))


(defun go-mode-defaults ()
  ;; Prefer goimports to gofmt if installed
  (let ((goimports (executable-find "goimports")))
    (when goimports
      (setq gofmt-command goimports)))

  (add-hook 'before-save-hook 'gofmt-before-save nil t)
  (whitespace-toggle-options '(tabs))
  (set (make-local-variable 'company-backends) '(company-go))

  (local-set-key (kbd "C-c C-b") 'pop-tag-mark)
  (local-set-key (kbd "C-c t") 'go-test-current-file)
  (setq tab-width 4))

(add-hook 'go-mode-hook 'go-mode-defaults)


(provide 'init-go)

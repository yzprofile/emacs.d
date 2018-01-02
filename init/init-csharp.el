(require-package 'omnisharp)

(setq omnisharp-company-match-sort-by-flx-score t)
(setq omnisharp-company-match-type 'company-match-flex)

(defun my-csharp-mode-setup ()
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (define-key omnisharp-mode-map (kbd "C-c C-j") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "C-c C-b") 'pop-tag-mark)
  (define-key omnisharp-mode-map (kbd "C-c C-c") 'omnisharp-helm-find-usages)
  (omnisharp-mode))

(after-load 'company
  (add-to-list 'company-backends #'company-omnisharp))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(provide 'init-csharp)

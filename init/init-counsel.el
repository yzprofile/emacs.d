(require-package 'counsel)

(ivy-mode 1)
(counsel-mode 1)

(use-package ivy :demand
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "))


(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'switch-to-buffer)



(provide 'init-counsel)

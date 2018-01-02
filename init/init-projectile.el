(require-package 'projectile)
(require-package 'helm-projectile)

(setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))

(projectile-mode)
(helm-projectile-on)


(provide 'init-projectile)

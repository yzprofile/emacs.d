(require-package 'js2-mode)
(require-package 'js2-refactor)
(require-package 'json)
(require-package 'rjsx-mode)
(require-package 'prettier-js)

(setq prettier-js-args '("--trailing-comma" "all"  "--bracket-spacing" "false" "--single-quote"))
(setq js-indent-level 2)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)

(provide 'init-js)

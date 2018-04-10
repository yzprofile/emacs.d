;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher"
           minver)))

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

(require 'init-package)
(require 'init-exec-path)
(require 'init-personal nil t)
(require 'init-font)
(require 'init-gui)
(require 'init-spacetheme)

;; (require 'init-theme)
;; (require 'init-powerline)
;; (require 'init-diminish)
;; (require 'init-term)

(require 'init-dash)
(require 'init-helm)
(require 'init-swiper)
(require 'init-edit)
(require 'init-flycheck)
(require 'init-whitespace)
(require 'init-undo-tree)
(require 'init-deft)
(require 'init-cscope)
(require 'init-multi-cursors)
(require 'init-markdown-mode)
(require 'init-smartparens)
(require 'init-rainbow)
(require 'init-window)

(require 'init-org)

(require 'init-image)
(require 'init-yasnippet)
(require 'init-erlang)
(require 'init-lisp)
(require 'init-haskell)
(require 'init-go)
(require 'init-c)
(require 'init-sql)
(require 'init-actionscript)

(require 'init-web)
(require 'init-python)
(require 'init-lua)
(require 'init-csharp)

(require 'init-company)
(require 'init-codesearch)
(require 'init-ace)
(require 'init-guide-key)

(require 'init-projectile)
(require 'init-git)

;; ;; (require 'init-exwm)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

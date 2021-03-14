;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let* ((minver "24.4"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required." minver)))

(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")

(setq gc-cons-threshold most-positive-fixnum)
(setq emacs-load-start-time (current-time))
(with-eval-after-load "enriched"
  (defun enriched-decode-display-prop (start end &optional param)
    (list start end)))
(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt))
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (>= emacs-major-version 24))
(setq *emacs25* (>= emacs-major-version 25))
(setq *emacs26* (>= emacs-major-version 26))
(setq *no-memory* (cond
                   (*is-a-mac*
                    ;; @see https://discussions.apple.com/thread/1753088
                    ;; "sysctl -n hw.physmem" does not work
                    (<= (string-to-number (shell-command-to-string "sysctl -n hw.memsize"))
                        (* 4 1024 1024)))
                   (*linux* nil)
                   (t nil)))

(when *emacs25*
  ;; (setq garbage-collection-messages t) ; for debug
  (setq best-gc-cons-threshold (* 64 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect))

(defun my-vc-merge-p ()
  (boundp 'startup-now))

(defun require-init (pkg &optional maybe-disabled)
  "Load PKG if MAYBE-DISABLED is nil or it's nil but start up in normal slowly."
  (when (or (not maybe-disabled) (not (my-vc-merge-p)))
    (load (file-truename (format "~/.emacs.d/init/%s" pkg)) t t)))

(defadvice switch-to-buffer (after switch-to-buffer-after-hack activate)
  (if (string= "*Messages*" (buffer-name))
      (read-only-mode -1)))

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
(require 'init-js)

;; ;; (require 'init-exwm)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

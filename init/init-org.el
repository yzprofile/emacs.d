(when (< emacs-major-version 24)
  (require-package 'org))
(require-package 'org-fstree)

(setq org-src-fontify-natively t)

;; (when *is-a-mac*
;;   (require-package 'org-mac-link)
;;   (autoload 'org-mac-grab-link "org-mac-link" nil t))

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Various preferences
(setq org-log-done t
      org-completion-use-ido t
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday nil
      org-agenda-span 14
      org-agenda-include-diary t
      org-agenda-window-setup 'current-window
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)


(setq org-refile-targets (quote ((nil :maxlevel . 5)
                                 (org-agenda-files :maxlevel . 5))))
(setq org-refile-use-outline-path (quote file))
(setq org-outline-path-complete-in-steps t)


(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
        (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#03A9F4" :weight bold))
        ("STARTED" . (:foreground "#4CAF50" :weight bold))
        ("DONE" . (:foreground "#FF6F00" :weight bold))
        ("WAITING" . (:foreground "#F44336" :weight bold))
        ("SOMEDAY" . (:foreground "#D500F9" :weight bold))
        ("CANCELLED" . (:foreground "#9E9E9E" :weight bold))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save the running clock and all clock history when exiting Emacs,
;; load it on startup
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))


(require-package 'org-pomodoro)
(after-load 'org-agenda
  (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))


(setq org-replace-disputed-keys t)
(setq org-confirm-babel-evaluate nil)
(setq org-babel-results-keyword "results")

(defun org-babel-execute:scheme (body params)
  (defvar-local cmd "")
  (setq cmd (format "racket -e '%s'" body))
  (message cmd)
  (shell-command-to-string cmd))

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (R . t)
     (ditaa . t)
     (plantuml . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (ledger . t)
     (ocaml . nil)
     (octave . t)
     (python . t)
     (ruby . t)
     (screen . nil)
     (sh . t)
     (sql . nil)
     (sqlite . t)
     )))

(provide 'init-org)

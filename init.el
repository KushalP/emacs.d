(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; Run this early on. Suppress the startup message flash on the
;; screen.
(setq inhibit-startup-message t)

;; This bootstraps us if we don't have anything.
(when (not package-archive-contents)
  (package-refresh-contents))

;; org-mode always needs to be installed if it's not already present
(when (not (package-installed-p 'org-plus-contrib))
  (package-install 'org-plus-contrib))

(require 'org)

;; Load the main config file.
(org-babel-load-file (concat user-emacs-directory "org/config.org"))
(org-babel-load-file (concat user-emacs-directory "org/ui.org"))

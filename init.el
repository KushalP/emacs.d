(require 'package)

(when (< emacs-major-version 27)
  (error "This setup requires Emacs v27, or higher. You have: v%d"
         emacs-major-version))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

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
(org-babel-load-file (concat user-emacs-directory "org/languages.org"))

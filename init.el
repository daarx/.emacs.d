(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(org-capture-templates
   (quote
    (("f" "Production bugs, fines" entry
      (id "prod-bugs-fines")
      (file "~/.emacs.d/org/templates/task.org")
      :prepend t)
     ("c" "Production bugs, CCM" entry
      (id "prod-bugs-ccm")
      (file "~/.emacs.d/org/templates/task.org")
      :prepend t)
     ("p" "Production bugs, common" entry
      (id "prod-bugs-common")
      (file "~/.emacs.d/org/templates/task.org")
      :prepend t)
     ("P" "Production bugs, program" entry
      (id "prod-bugs-program")
      (file "~/.emacs.d/org/templates/task.org")
      :prepend t)
     ("S" "Production support" entry
      (id "prod-support")
      (file "~/.emacs.d/org/templates/task.org")
      :prepend t)
     ("s" "Story (normal development)" entry
      (id "stories")
      (file "~/.emacs.d/org/templates/task.org")
      :prepend t :jump-to-captured t))))
 '(package-selected-packages (quote (org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      ketp-old-versions 2
      version-control t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 120 4))

(setq inhibit-startup-message t)
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

;;;;
;;;; cygwin support
;;;;

;; Sets your shell to use cygwin's bash, if Emacs finds it's running
;; under Windows and c:\cygwin exists. Assumes that C:\cygwin\bin is
;; not already in your Windows Path (it generally should not be).
;;
(let* ((cygwin-root "c:/cygwin64")
       (cygwin-bin (concat cygwin-root "/bin")))
  (when (and (eq 'windows-nt system-type)
             (file-readable-p cygwin-root))

    (setq exec-path (cons cygwin-bin exec-path))
    (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))

    ;; By default use the Windows HOME.
    ;; Otherwise, uncomment below to set a HOME
    ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))

    ;; NT-emacs assumes a Windows shell. Change to bash.
    (setq shell-file-name "bash")
    (setenv "SHELL" shell-file-name) 
    (setq explicit-shell-file-name shell-file-name) 

    ;; This removes unsightly ^M characters that would otherwise
    ;; appear in the output of java applications.
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation"
  (interactive)
  (revert-buffer t t))

(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;; org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Start emacs instance as server, allowing emacsclient to connect to it
(server-start)

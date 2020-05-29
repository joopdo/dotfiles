
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(tool-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;(require 'org-bullets)
;(use-package org-bullets
;    :hook (org-mode . org-bullets-mode))

;; find aspell and hunspell automatically
(cond
 ;; try hunspell at first
  ;; if hunspell does NOT exist, use aspell
 ((executable-find "hunspell")
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
        ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
          )))

 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))

;(require 'langtool)

(setq langtool-java-classpath
        "/usr/share/languagetool:/usr/share/java/languagetool/*")
(setq langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-commandline.jar")
(setq langtool-java-bin "/usr/bin/java")

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'after-save-hook 'langtool-check nil t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
 (python . t)
   (emacs-lisp . t)))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("shell" "python" "emacs-lisp"))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
 '(custom-enabled-themes (quote (ayu)))
(load-theme 'ayu t)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(evil-want-fine-undo t)
 '(global-linum-mode t)
 '(global-undo-tree-mode nil)
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Amazon Ember Mono" :foundry "DAMA" :slant normal :weight normal :height 113 :width normal)))))

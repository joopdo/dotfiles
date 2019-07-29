(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(tool-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(require 'org-bullets)
(use-package org-bullets
    :hook (org-mode . org-bullets-mode))

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

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
 '(custom-enabled-themes (quote (ayu)))
(load-theme 'ayu t)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

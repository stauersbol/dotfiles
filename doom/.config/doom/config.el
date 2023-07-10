;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; USER CONFIG
(setq user-full-name "Lukas Stauersbøl"
      user-mail-address "lukas.stauersbol@gmail.com")

;; DOOM CONFIG
(setq doom-font (font-spec :family "Fira Code" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "Fira Code" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq doom-theme 'catppuccin)
(setq doom-themes-treemacs-theme "doom-colors")
(setq catppuccin-flavor 'mocha)

;; LINE NUMBER CONFIG
(setq display-line-numbers-type t)

;; ORG CONFIG
(setq org-directory "~/org/")

;; BLAMER CONFIG
;; (use-package blamer
;;   :bind (("s-i" . blamer-show-commit-info))
;;   :defer 20
;;   :custom
;;   (blamer-idle-time 0.3)
;;   (blamer-min-offset 70)
;;   :custom-face
;;   (blamer-face ((t :foreground "#7a88cf"
;;                    :background nil
;;                    :height 110
;;                    :italic t)))
;;   :config
;;   (global-blamer-mode t)
;;   )
;; (setq blamer-author-formatter " ✎ %s ")
;; (setq blamer-datetime-formatter "[%s]")
;; (setq blamer-commit-formatter " ● %s")
;; (setq blamer-prettify-time-p t)

;; LSP CONFIG
(use-package lsp-ui)
(setq lsp-ui-mode t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-delay 0.2)
(setq lsp-ui-doc-max-width 140)
(setq lsp-ui-doc-max-height 160)

(setq lsp-modeline-diagnostics-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-completion-enable t)
(setq lsp-lens-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-signature-render-documentation nil)

(use-package lsp-mode
  :defer t
  :config
  (advice-add 'json-parse-string :around
              (lambda (orig string &rest rest)
                (apply orig (s-replace "\\u0000" "" string)
                       rest)))
  (advice-add 'json-parse-buffer :around
              (lambda (orig &rest rest)
                (while (re-search-forward "\\u0000" nil t)
                  (replace-match ""))
                (apply orig rest)))
  )

;; WAKATIME CONFIG
(use-package wakatime-mode
  :ensure t
  :if (executable-find "wakatime")
  :init
  (setq wakatime-cli-path (executable-find "wakatime"))
  :config
  (global-wakatime-mode))

;; DOOM MODELINE CONFIG
(setq doom-modeline-time t)
(setq doom-modeline-time-icon t)
(setq doom-modeline-github t)
(setq doom-modeline-indent-info t)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-buffer-encoding t)

;; MAGIT CONFIG
(setq magit-todos-mode t)

;; PROJECTILE CONFIG
(setq projectile-project-search-path '("~/Projects" "/mnt/data/Projects"))

;; EMACS
(setq require-final-newline t)
(setq mode-require-final-newline t)

;; LIGATURES
;; (use-package fira-code-mode
;;   :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" ":" "#_" "#_(" "x"))
;;   :hook prog-mode)

;; TREEMACS
(setq treemacs-git-commit-diff-mode nil)

;; EVIL NERD COMMENTER
(evilnc-default-hotkeys)

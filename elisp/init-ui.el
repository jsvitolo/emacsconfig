;;; jv-UI.el --- -*- lexical-binding: t -*-
;;; commentary:
;; File contains configs that makes Emacs more "modern".
;;; code:

;; doom-theme
;; what it does, theme Emacs, though of recent, once upon a time, you needed
;; this and all-the-icons (not that necessary) to actually make doom-modeline
;; look nice.  Fun times...
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic t)
  (load-theme 'doom-dracula t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom (
    (doom-modeline-height 6)
    (doom-modeline-battery t)))

;; if you encounter lag, uncomment below
(setq inhibit-compacting-font-caches t)

;; line numbers
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; wrap texts
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)

;; Display column numbers in modeline
(column-number-mode 1)

;; Depressing scratch board no more depressing (or is it still?)
;; edit to taste
(setq inhibit-startup-screen t)
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "Back to work or cry meistens?\n")

;; 1920px without affecting company box, edit the values to suit your screen
(if (window-system) (set-frame-size (selected-frame) 90 35))

;; split frame size
(setq default-frame-alist '((width . 85) (height . 35)))

;; frame transparency
(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))

;; displays a panel for commands keyed in
(use-package command-log-mode)

;; fonts setup, change to fit your system
(set-frame-font "Hack Nerd Font" nil t)
(set-face-attribute 'default nil
		    :height 140
		    :weight 'bold)

;; mode-line font
(set-face-attribute 'mode-line nil
		    :font "Fira Code"
		    :height 134)

;; frame scaling/zooming
(use-package default-text-scale
  :defer 1
  :config
  (default-text-scale-mode))

;; ace-window
(use-package ace-window
  :bind ("M-o" . ace-window))

;; Focus on split window
(defun split-and-follow-horizontally ()
  "Focus on split window."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-and-follow-vertically ()
  "Focus on split window."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

;; kill buffer without asking for confirmation
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(use-package ligature
  :load-path "site-elisp/ligature.el"
  :config
  ;; Enable all Iosevka ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
;;   Enables ligature checks globally in all buffers. You can also do it
;;   per mode with `ligature-mode'.
  (global-ligature-mode t))

(provide 'init-ui)
;;; init-ui.el ends here

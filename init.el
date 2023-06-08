;;; init.el --- -*- lexical-binding: t -*-
;;; commentary:
;; This file contains imports of different packages and settings found in the
;; elisp/ folder.  Makes it easy to troubleshoot and configure without putting
;; all setup in one file.
;;; code:

;; early init
(require 'early-init)

;; UI
(require 'init-ui)
(require 'init-treemacs)
(require 'init-docker)

(require 'init-evil)
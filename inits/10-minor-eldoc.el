;;; 10-minor-eldoc.el --- 設定 - マイナーモード - Emacs Lisp ドキュメント表示

;; Copyright (C) 2013-2018 Taku Watabe
;; Time-stamp: <2018-11-15T19:50:07+09:00>

;;; Commentary:

;;; Code:

;; ----------------------------------------------------------------------------
;; デフォルト値
;; ----------------------------------------------------------------------------
(custom-set-variables
 '(eldoc-minor-mode-string nil)
 '(eldoc-idle-delay 0.2)
 '(eldoc-echo-area-use-multiline-p 'truncate-sym-name-if-fit))


;; ----------------------------------------------------------------------------
;; 起動
;; ----------------------------------------------------------------------------
;; (when (fboundp 'eldoc-mode)
;;   (add-hook 'lisp-mode-hook #'eldoc-mode)
;;   (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
;;   (add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
;;   (add-hook 'ielm-mode-hook #'eldoc-mode))


;; ----------------------------------------------------------------------------
;; Local Variables:
;; coding: utf-8-unix
;; mode: Emacs-Lisp
;; no-byte-compile: t
;; End:

;;; 10-minor-eldoc.el ends here

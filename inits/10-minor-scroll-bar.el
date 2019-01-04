;;; 10-minor-scroll-bar.el --- 設定 - マイナーモード - スクロールバー

;; Copyright (C) 2013-2016 Taku Watabe
;; Time-stamp: <2016-10-13T16:49:36+09:00>

;;; Commentary:

;;; Code:

;; ----------------------------------------------------------------------------
;; 起動
;; ----------------------------------------------------------------------------
(eval-after-load 'scroll-bar
  '(progn
     ;; ウインドウシステム上では、あらゆるスクロールバーを非表示化
     (set-scroll-bar-mode (if window-system nil 'right))))

;; GNU Emacs 25 以降用
(defun my-scroll-bar-initilalize ()
  "Initialize `scroll-bar' settings."
  (eval-after-load 'scroll-bar
    '(progn
       (when window-system
         (if (fboundp 'scroll-bar-mode)
             (scroll-bar-mode -1))
         (if (fboundp 'horizontal-scroll-bar-mode)
             (horizontal-scroll-bar-mode -1))))))

;; このタイミングで実行しないと適用されない問題がある
(add-hook 'after-init-hook #'my-scroll-bar-initilalize)


;; ----------------------------------------------------------------------------
;; Local Variables:
;; coding: utf-8-unix
;; mode: Emacs-Lisp
;; no-byte-compile: t
;; End:

;;; 10-minor-scroll-bar.el ends here

;;; cocoa-emacs-00-00-environment.el --- 設定 - macOS (Cocoa) - 環境

;; Copyright (C) 2018 Taku Watabe
;; Time-stamp: <2018-11-15T19:29:08+09:00>

;;; Commentary:

;;; Code:
;;
;; GnuTLS trustfiles 追加
(when (gnutls-available-p)
  ;; グローバル変数未定義の場合に備える
  (if (not (boundp 'gnutls-trustfiles))
      (setq gnutls-trustfiles nil))
  ;; 追加開始
  ;;
  ;; see also:
  ;; https://emacs.stackexchange.com/a/18070
  (let ((trust-files '("/usr/local/etc/openssl/cert.pem"
                       "/usr/local/etc/libressl/cert.pem")))
    (dolist (trust-file trust-files)
      (setq trust-file (convert-standard-filename trust-file))
      (if (file-exists-p trust-file)
          (add-to-list 'gnutls-trustfiles trust-file t)))))


;; ----------------------------------------------------------------------------
;; Local Variables:
;; coding: utf-8-unix
;; mode: Emacs-Lisp
;; no-byte-compile: t
;; End:

;;; cocoa-emacs-00-00-environment.el ends here

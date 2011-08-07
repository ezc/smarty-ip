;;; smarty-ip.el --- ip location tools for emacs

;; Copyright (C) kbonez.com

;; Author: Breeze.Kay <dev@kbonez.net>
;; Created: 5 Aug 2011
;; Version: 0.8.7
;; Keywords: tools

;; This file is not (yet) part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Change Log:
;;  7 Aug 2011 - add user-config feature
;;  6 Aug 2011 - Separate config code and function code
;;  5 Aug 2011 - Rebuild this programe,Separate some function can be used in other programes
;;  5 Aug 2011 - First Release


;;; Commentary:
;;  this programe is a subset of smarty-package, To use this, just put/replace it in smarty-package path. NOTE smarty-package must be added in your load-path.  When you add smary-package,it will auto load it.
;;  To load smarty-package,use this in your .emacs file.
;;    (load "smarty")
;;
;; configure file:
;;  If you install versions of smarty-ip in different languages.You MUST clean old language files ,the location is
;;  smarty-package-path/configure/smarty-ip-*.el
;; If you custom configure name ,it should be your custom-name
;;  smarty-package-path/`smarty-configure'/smarty-ip-*.el
;;
;; currently,it only support chinese and english. but you can config which you use.
;;
;;  - copy smarty-package-path/`smarty-configure'/smarty-ip-en.el to smarty-ip-local.el
;;  - edit smarty-ip-local.el file.
;;
;;
;; functions you may want to use:
;; M-x smarty-ip-interactive
;;    `smarty-ip-interactive' advanced version,if user active mark,the programe will try to search region,if not,it will be try to search current-point to line-end.
;; M-x smarty-ip
;;     get ip-info by interacting with the system.the simplest way to get ip but I don't recommend you use it directly.you should use this `smarty-ip'
;;

;;; ToDo:
;; - add replace ip to city in buffer
;; - extend return-message format, let it can allow user-define.
;; - allow translate the result to user-prefer


;;; FAQ:



;;; Code:

(require 'smarty-utils)
(require 'smarty-filter)
;; (require 'smarty-wm)

(defgroup smarty-ip nil
  "smarty-ip tools group."
  :prefix "smarty-ip"
  :group 'smarty)


(defcustom smarty-ip-translate-flag nil
  "THIS IS A TODO FEATURE.translate display-message to your locale.if this is nil,don't do translate.t will translate it. this flag depends `smarty-translate.el'"
  :group 'smarty-ip)

(when smarty-ip-translate-flag
  (require 'smarty-translate))


(defcustom smarty-ip-locale smarty-locale
  "ip convert display locale"
  :group 'smarty-ip)


(defcustom smarty-ip-buffer-name "*smarty-ip*"
  "smarty-ip buffer."
  :group 'smarty-ip)


;; currently ,this is only support xml format,so I disable it.
;; (defcustom smarty-ip-data-format "xml"
;;   "data return format."
;;   :group 'smarty-ip)


(dolist (file (list "smarty-ip-cn.el"
                    "smarty-ip-en.el"
                    "smarty-ip-local.el"))

              (let ((f (expand-file-name file (expand-file-name smarty-configure (file-name-directory load-file-name)))))

                (if (file-exists-p f)
                    (when (load f)
                      (message "%s Load Success..." file)))))




(defun smarty-ip()
  "`smarty-ip-interactive' advanced version,if user active mark,the programe will try to search region,if not,it will be try to search current-point to line-end."
  (interactive)
  (let ((ip-text (smarty-get-buffer-text)))
    (dolist (ip (smarty-filter-ip ip-text))
      (smarty-ip-interactive ip))))

(defun smarty-ip-interactive(ip)
  "get ip-info by interacting with the system.the simplest way to get ip but i don't recommend you use it directly.you should use this `smarty-ip'"
  (interactive "s[input ip]:")
  (let ((ip-buffer (url-retrieve
                    (concat smarty-ip-api ip)
                    'smarty-ip-callback (list ip))))))


(defun smarty-ip-callback(status &optional ip)
  "`smarty-ip-interactive' callback"
  (let ((doc (progn
               (set-buffer (current-buffer))
               (buffer-substring (point-min) (point-max)))))
    
    (let ((result (if (string-match (concat "<" smarty-ip-result-name  ">\\([^<]*\\)</" smarty-ip-result-name ">") doc)
                      (match-string 1 doc)
                    ""))
          (city (if (string-match (concat "<" smarty-ip-city-name ">\\([^<]*\\)</" smarty-ip-city-name ">") doc)
                    (match-string 1 doc)
                  ""))
          (country (if (string-match (concat "<" smarty-ip-country-name ">\\([^<]*\\)</" smarty-ip-country-name ">") doc)
                       (match-string 1 doc)
                     ""))
          (sp (if (string-match (concat "<" smarty-ip-sp-name ">\\([^<]*\\)</" smarty-ip-sp-name ">") doc)
                  (match-string 1 doc)
                "")))


      (let ((r (cond
                     ((string= smarty-ip-fail-node smarty-ip-result-name)
                      result)
                     ((string= smarty-ip-fail-node smarty-ip-city-name)
                      city)
                     ((string= smarty-ip-fail-node smarty-ip-country-name)
                      country)
                     ((string= smarty-ip-fail-node smarty-ip-sp-name)
                      sp))))
        (switch-to-buffer-other-window smarty-ip-buffer-name t)
        (setq buffer-read-only nil)
        (goto-char (point-max))
        (if (string= r smarty-ip-fail-value)
            (insert (format (concat smarty-ip-msg-notfind "\n") ip))
          (insert (format
                   (concat smarty-ip-msg-findout "\n") ip (mm-decode-coding-string city  (mm-charset-to-coding-system smarty-ip-api-charset)) (mm-decode-coding-string sp (mm-charset-to-coding-system smarty-ip-api-charset)))))
        (setq buffer-read-only t)))))






(provide 'smarty-ip)
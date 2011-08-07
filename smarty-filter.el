;;; smarty-filter.el --- smarty packages base libary

;; Copyright (C) kbonez.com

;; Author: Breeze.Kay <dev@kbonez.net>
;; Created: 5 Aug 2011
;; Version: 0.8.4
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
;;  5 Aug 2011 - First Release


;;; Commentary:
;; To use this, put smarty-filter.el somewhere on your load-path.  Then add
;; this to your .emacs:
;;    (load "smarty-filter")
;;
;;
;;

;;; ToDo:
;;  - filter other data,plaing

;;; Code:

(defun smarty-filter-ip(ip-text)
  "filter text,get an ip-list from text,if there is ip-string in text."

  (let ((ip-list '())
        (ip-regxp "\\(25[0-5]\\|2[0-4][0-9]\\|[01]?[0-9][0-9]?\\)\\.\\(25[0-5]\\|2[0-4][0-9]\\|[01]?[0-9][0-9]?\\)\\.\\(25[0-5]\\|2[0-4][0-9]\\|[01]?[0-9][0-9]?\\)\\.\\(25[0-5]\\|2[0-4][0-9]\\|[01]?[0-9][0-9]?\\)"))
    
    (if (string-match ip-regxp ip-text)
        (progn
          (setq ip-list (cons (format "%s.%s.%s.%s"
                                      (match-string 1 ip-text)
                                      (match-string 2 ip-text)
                                      (match-string 3 ip-text)
                                      (match-string 4 ip-text)) ip-list))


          (while (string-match ip-regxp ip-text (match-end 4))
            (setq ip-list (cons (format "%s.%s.%s.%s"
                                        (match-string 1 ip-text)
                                        (match-string 2 ip-text)
                                        (match-string 3 ip-text)
                                        (match-string 4 ip-text)) ip-list)))))

    ip-list))


(provide 'smarty-filter)

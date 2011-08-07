;;; smarty-utils.el --- smarty packages base libary

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
;;  In general,you SHOULD NOT use this file directly,
;;  It should be called from other programes in smarty-package.
;;    (require "smarty-utils")
;;
;;
;;

;;; ToDo:
;; - `smarty-get-buffer-text' can support more get-method, such as get a word.

;;; Code:

(defun smarty-get-buffer-text()
  "get buffer text,if set region,get region-text,otherwise get the text from `(point)' to `(line-end-positon)'"
  (let ((text (progn
                (let ((start (if (and mark-active transient-mark-mode)
                                 (region-beginning)
                               (point)))
                      (end (if (and mark-active transient-mark-mode)
                               (region-end)
                             (line-end-position))))
                  (buffer-substring start end)))))
    text))


(provide 'smarty-utils)

;;; smarty.el --- smarty tools package for emacs

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
;; To use this, put smarty-ip.el somewhere on your load-path.  Then add
;; this to your .emacs:
;;    (load "smarty")
;;
;;
;;
;;

;;; ToDo:
;; - release the real materials smarty,
;;   will contain lots feature improve default emacs setting.

;;; Code:

(defgroup smarty nil
  "smarty tools."
  :prefix "smarty-"
  :group 'matching)

(defcustom smarty-locale "en"
  "ip convert display locale"
  :group 'smarty)

(defcustom smarty-configure "configure"
  "smarty-configure dir"
  :group 'smarty)


(dolist (file (list
               "smarty-utils.el"
               "smarty-filter.el"
               
               "smarty-ip.el"
               "smarty-translater.el"))

  (let ((f (expand-file-name file (file-name-directory load-file-name))))

    (if (file-exists-p f)
        (when (load f)
          (message "%s Load Success..." file)))))
 

(provide 'smarty)
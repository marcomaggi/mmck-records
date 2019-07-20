;;; -*- coding: utf-8-unix  -*-
;;;
;;;Part of: MMCK Records
;;;Contents: version functions
;;;Date: Jul 20, 2019
;;;
;;;Abstract
;;;
;;;	This unit defines version functions.
;;;
;;;Copyright (C) 2019 Marco Maggi <mrc.mgg@gmail.com>
;;;
;;;This program is free software: you can  redistribute it and/or modify it under the
;;;terms of the GNU  Lesser General Public License as published  by the Free Software
;;;Foundation,  either version  3  of the  License,  or (at  your  option) any  later
;;;version.
;;;
;;;This program is  distributed in the hope  that it will be useful,  but WITHOUT ANY
;;;WARRANTY; without  even the implied warranty  of MERCHANTABILITY or FITNESS  FOR A
;;;PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
;;;
;;;You should  have received a  copy of the GNU  Lesser General Public  License along
;;;with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


;;;; units and module header

(declare (unit mmck.records.version)
	 (emit-import-library mmck.records.version))

(module (mmck.records.version)
    (mmck-records-package-major-version
     mmck-records-package-minor-version
     mmck-records-package-patch-level
     mmck-records-package-prerelease-tag
     mmck-records-package-build-metadata
     mmck-records-package-version
     mmck-records-package-semantic-version)
  (import (scheme)
	  (prefix mmck.records.config config::))


;;;; version functions

(define (mmck-records-package-major-version)	config::MMUX_PKG_MAJOR_VERSION)
(define (mmck-records-package-minor-version)	config::MMUX_PKG_MINOR_VERSION)
(define (mmck-records-package-patch-level)	config::MMUX_PKG_PATCH_LEVEL)
(define (mmck-records-package-prerelease-tag)	config::MMUX_PKG_PRERELEASE_TAG)
(define (mmck-records-package-build-metadata)	config::MMUX_PKG_BUILD_METADATA)
(define (mmck-records-package-version)		config::MMUX_PKG_VERSION)
(define (mmck-records-package-semantic-version)	config::MMUX_PKG_SEMANTIC_VERSION)


;;;; done

#| end of module |# )

;;; end of file

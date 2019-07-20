;;; -*- coding: utf-8-unix  -*-
;;;
;;;Part of: MMCK Records
;;;Contents: module implementing the syntactic API
;;;Date: Jul 20, 2019
;;;
;;;Abstract
;;;
;;;	This unit defines the syntactic records API.
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

(declare (unit mmck.records.syntactic)
	 (uses mmck.records.helpers)
	 (uses mmck.records.procedural)
	 (emit-import-library mmck.records.syntactic))

(module (mmck.records.syntactic)
    (define-record-type)
  (import (scheme)
	  (mmck records procedural)
	  (mmck records helpers))
  (import-for-syntax (scheme)
		     (only (chicken syntax)
			   er-macro-transformer)
		     (only (matchable)
			   match)
		     (mmck records helpers))


;;;; syntax DEFINE-RECORD-TYPE

(define-syntax define-record-type
  (er-macro-transformer
    (lambda (input-form.stx rename compare)


;;;; syntax DEFINE-RECORD-TYPE: main procedure and helpers

(define (main input-form.stx)
  (receive (record-name.id)
      (parse-input-form input-form.stx)
    (build-output-form record-name.id)))

(define (synner message . args)
  (apply syntax-error 'define-record-type message input-form.stx args))


;;;; syntax DEFINE-RECORD-TYPE: syntactic identifiers required in the output form

(define %begin			(rename 'begin))
(define %define			(rename 'define))
(define %lambda			(rename 'lambda))


;;;; syntax DEFINE-RECORD-TYPE: parsing input form

(define (parse-input-form input-form.stx)
  (match input-form.stx
    ((_ ?record-type)
     (values ?record-type))
    (_
     (synner "invalid syntax in input form"))))


;;;; syntax DEFINE-RECORD-TYPE: building output form

(define (build-output-form record-name.id)
  `(,%begin #f))


;;;; syntax DEFINE-RECORD-TYPE: let's go

(main input-form.stx))))


;;;; done

#| end of module |# )

;;; end of file

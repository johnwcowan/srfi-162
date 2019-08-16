(module srfi-128 ()
  (import (scheme))
  (import (only (chicken base) include case-lambda error
    define-record-type make-parameter parameterize
    exact-integer? infinite? nan?))
  (import (only (chicken type) : define-type))
  (import (only (chicken module) export))
  (import (srfi 4))
  (import (only (srfi 13) string-downcase))

  (export comparator? comparator-ordered? comparator-hashable?)
  (export make-comparator
          make-pair-comparator make-list-comparator make-vector-comparator
          make-eq-comparator make-eqv-comparator make-equal-comparator)
  (export boolean-hash char-hash char-ci-hash
          string-hash string-ci-hash symbol-hash number-hash)
  (export make-default-comparator default-hash comparator-register-default!)
  (export comparator-test-type comparator-check-type comparator-hash)
  (export %salt% hash-bound hash-salt)
  (export =? <? >? <=? >=?)
  (export comparator-if<=>)
  (export comparator-type-test-predicate comparator-equality-predicate
    comparator-ordering-predicate comparator-hash-function)
  (export comparator-max comparator-min)
  (export default-comparator boolean-comparator real-comparator
          char-comparator char-ci-comparator
          string-comparator string-ci-comparator
          list-comparator vector-comparator)
  
  (define-type Comparator (struct comparator))
  (define-type Type-test (procedure (*) boolean))
  (define-type Comparison-test (procedure (* *) boolean))
  (define-type Hash-code fixnum)
  (define-type Hash-function (procedure (*) Hash-code))

  (include "srfi/128/chicken5-shim.scm")
  (include "srfi/128/128-impl.scm")
  (include "srfi/128/128-default.scm")
  (include "srfi/128/162.scm")  ; must be last

  ;; Chicken type declarations
  (: comparator? (* --> boolean : Comparator))
  (: comparator-type-test-predicate (Comparator --> Type-test))
  (: comparator-equality-predicate (Comparator --> Comparison-test))
  (: comparator-ordering-predicate (Comparator --> Comparison-test))
  (: comparator-hash-function (Comparator --> Hash-function))
  (: comparator-ordered? (Comparator --> boolean))
  (: comparator-hashable? (Comparator --> boolean))
  (: make-comparator
   ((or true Type-test)
    (or true Comparison-test)
    (or false Comparison-test)
    (or false Hash-function)
    --> Comparator))
  (: comparator-test-type (Comparator * --> boolean))
  (: comparator-check-type (Comparator * --> true))
  (: comparator-hash (Comparator * --> Hash-code))
  (: binary=? (Comparator * * --> boolean))
  (: binary<? (Comparator * * --> boolean))
  (: binary>? (Comparator * * --> boolean))
  (: binary<=? (Comparator * * --> boolean))
  (: binary>=? (Comparator * * --> boolean))
  (: =? (Comparator * * &rest * * --> boolean))
  (: <? (Comparator * * &rest * * --> boolean))
  (: >? (Comparator * * &rest * * --> boolean))
  (: <=? (Comparator * * &rest * * --> boolean))
  (: >=? (Comparator * * &rest * * --> boolean))
  (: boolean<? (boolean boolean --> boolean))
  (: boolean-hash (boolean --> Hash-code))
  (: char-hash (char --> Hash-code))
  (: char-ci-hash (char --> Hash-code))
  (: number-hash (number --> Hash-code))
  (: complex<? (number number --> boolean)) ;; FIXME
  (: string-ci-hash (string --> Hash-code))
  (: symbol<? (symbol symbol --> boolean))
  (: symbol-hash (symbol --> Hash-code))
  (: make-eq-comparator (--> Comparator))
  (: make-eqv-comparator (--> Comparator))
  (: make-equal-comparator (--> Comparator))
  (: limit Hash-code)
  (: make-pair-comparator (Comparator Comparator --> Comparator))
  (: make-pair-type-test (Comparator Comparator --> Type-test))
  (: make-pair=? (Comparator Comparator --> Comparison-test))
  (: make-pair<? (Comparator Comparator --> Comparison-test))
  (: make-hash (Comparator Comparator --> Hash-function))
  (: make-list-comparator (Comparator Type-test Type-test (procedure (*) *)  (procedure (*) *) --> Comparator))
  (: make-vector-comparator (Comparator Type-test (procedure (*) fixnum) (procedure (* fixnum) *) --> Comparator))
  (: string-hash (string --> Hash-code))
  (: comparator-register-default! (Comparator -> . *))
  (: default-hash (* --> Hash-code))
  (: make-default-comparator (--> Comparator))
  ;; FIXME: add SRFI 162 declarations
)

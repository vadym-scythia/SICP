#lang sicp

(define (same-parity x . elements)
  (define (get-parity elems result flag)
    (if (null? elems)
        (cons x (reverse result))
        (if (equal? (even? (car elems)) flag)
            (get-parity (cdr elems) (cons (car elems) result) flag)
            (get-parity (cdr elems) result flag))))
  (get-parity elements (list) (even? x)))

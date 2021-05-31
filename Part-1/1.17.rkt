#lang sicp

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? a)
  (= (remainder a 2) 0))

(define (fast-multipl a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-multipl a (halve b))))
        (else (+ a (fast-multipl a (- b 1))))))
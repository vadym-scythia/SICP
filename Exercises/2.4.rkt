#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

; (car (cons 2 3)) -> ((m 2 3) (lambda (p q) q)) -> ((lambda (p q) q) 2 3) -> ((lambda (2 3) 3) 2 3) -> 3
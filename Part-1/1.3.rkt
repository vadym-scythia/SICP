#lang sicp

(define (sqr a) (* a a))

(define (twoBigSqr x y z)
  (cond ((and (> x z) (> y z)) (+ (sqr x) (sqr y)))
        ((and (> x y) (> z y)) (+ (sqr x) (sqr z)))
        ((and (> y x) (> z x)) (+ (sqr y) (sqr z)))))
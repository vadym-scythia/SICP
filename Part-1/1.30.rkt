#lang sicp

(define (sum-linear-recurs term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-linear-recurs term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (cube x) (* x x x))
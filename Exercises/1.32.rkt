#lang sicp

; concrete accumulators

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (product term n next)
  (if (< n 1)
      1
      (* (term n) (product term (next n) next))))

; abstract accumulators

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accum-sum term a next b)
  (accumulate + 0 term a next b))

(define (accum-product term n next)
  (accumulate * 1 term 1 next n)) 

; base

(define (inc n) (+ n 1))

(define (identity x) x)

; result

(define (accum-sum-int a b)
  (accum-sum identity a inc b))

(define (accum-prod-factorial n)
  (accum-product identity n inc))

; iterative forms

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (accum-sum-int-iter a b)
  (accumulate-iter + 0 identity a inc b))

(define (accum-prod-factorial-iter n)
  (accumulate-iter * 1 identity 1 inc n))

#lang sicp

(define (factorial n)
  (if (< n 1)
      1
      (* n (factorial (- n 1)))))

(define (pi-wallis n)
  (if (< n 1)
      1
      (* (* (/ (* 2 n) (- (* 2 n) 1)) (/ (* 2 n) (+ (* 2 n) 1))) (pi-wallis (- n 2)))))

(define (product term n next)
  (if (< n 1)
      1
      (* (term n) (product term (next n) next))))

(define (identity x) x)

(define (dec x) (- x 1))

(define (product-factorial n)
  (product identity n dec))

(define (long-product x)
  (* (/ (* 2 x) (- (* 2 x) 1)) (/ (* 2 x) (+ (* 2 x) 1))))

(define (dec-2 x)
  (- x 2))

(define (product-pi-wallis n)
  (product long-product n dec-2))

(define (product-iter term n next)
  (define (iter n result)
    (if (< n 1)
        result
        (iter (next n) (* (term n) result))))
  (iter n 1))

(define (product-iter-factorial n)
  (product-iter identity n dec))

(define (product-iter-pi-wallis n)
  (product-iter long-product n dec-2))
#lang sicp

(define dx 0.0000001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth-repeated f n)
  (repeated (smooth f) n))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))
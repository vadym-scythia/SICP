#lang sicp

; util

(define tolerance 0.00001)

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

; iterative-improve

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

; fixed-point

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (x) (close-enough? x (f x)))
    f)
   first-guess))

(define (sqrt-fixed-point x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

; sqrt

(define (sqrt x)
  ((iterative-improve
    (lambda (y) (< (abs (- (square y) x)) tolerance))
    (lambda (y) (average y (/ x y))))
   1.0))
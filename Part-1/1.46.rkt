#lang sicp

; sqrt

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; fixed-point

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; iterative-improve

(define start-guess 1.0)

(define (iterative-improve cool-enough? improve-func)
  (define (func cool-enough? improve-func guess)
    (lambda (x) (if (cool-enough? guess x)
                    guess
                    ((func cool-enough? improve-func (improve-func guess x)) x))))
  (func cool-enough? improve-func start-guess))

; improved sqrt

(define (sqrt-impr x)
  ((iterative-improve good-enough? improve) x))
  
  







  
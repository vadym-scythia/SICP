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

(define (iterative-improve cool-enough? improve-func first-guess)
  (define (func cool-enough? improve-func guess)
    (lambda (x) (if (cool-enough? guess x)
                    guess
                    ((func cool-enough? improve-func ((improve-func x) guess)) x))))
  (func cool-enough? improve-func first-guess))

; improved sqrt

(define (improve-impr x)
  (lambda (y) (average y (/ x y))))

(define (sqrt-impr x)
  ((iterative-improve good-enough? improve-impr 1.0) x))

; improved fixed-point, used by sqrt
; substituted close-enough?

(define  (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fx-pnt-impr f first-guess value)
  ((iterative-improve close-enough? f first-guess) value))

(define (sqrt-fx-pnt-impr x)
  (fx-pnt-impr (average-damp (lambda (y) (/ x y)))
               1.0
               x))



(define (test-improve guess x)
  (+ guess x))

(define (test x)
  (fx-pnt-impr test-improve))







  
#lang sicp

; origin sqrt

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

; better 'good-enough?'

(define (better-sqrt under-root allow-range) ; smaller 'allow-range' gives more accurate result, but needs more resources. 
  (better-sqrt-iter 1.0 under-root allow-range))

(define (better-sqrt-iter guess under-root allow-range)
  (if (better-good-enough? guess under-root allow-range)
      guess
      (better-sqrt-iter (improve guess under-root)
                 under-root allow-range)))

(define (better-good-enough? guess under-root allow-range)
(< (abs (- (improve guess under-root) guess)) allow-range)) ; extra call of 'ipmrove' ._.
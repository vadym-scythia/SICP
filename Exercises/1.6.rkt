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

; custom if

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; sqrt with custom if

(define (sqrt-cust-if x)
  (sqrt-iter-cust-if 1.0 x))

(define (sqrt-iter-cust-if guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-cust-if (improve guess x)
                             x)))

; result: proc 'new-if' uses 'cond', where (<true-predicate>, <expression>) will return last expression. As 'sqrt-iter-cust-if' is recursive -- evalution thread would never stop. 
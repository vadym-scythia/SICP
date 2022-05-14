#lang sicp

(define tolerance 0.00000000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube x)
  (* x x x))

(define (mult-times x times)
  (define (mult-times-acumm accum x times)
    (if (= times 1)
        (* accum x)
        (mult-times-acumm (* accum x) x (- times 1))))
  (mult-times-acumm 1 x times))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (n-root n value)
  (fixed-point ((repeated average-damp (floor (log n 2)))
                (lambda (y) (/ value (power y (- n 1)))))
               1.0))
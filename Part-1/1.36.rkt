#lang sicp

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)(newline)      
      (if (close-enough? guess next)
          next
          (try next))))
    (try first-guess))

;(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 100.0))
(define (w-dumping x)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) x))

(define (wo-dumping x)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) x))

; if (= x 2), then with dumping (= lines 34), but without dumping (= lines 8)
; dumping reduces steps in 4.25 times
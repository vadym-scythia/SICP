#lang sicp

(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ 1 i))))))
  (recur 1))

(define (tan-cf x k)
  (cont-frac
   (lambda (i) (if (= i 1) x (* x x -1)))
   (lambda (i) (- (* 2.0 i) 1))
   k))
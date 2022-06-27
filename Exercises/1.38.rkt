#lang sicp

(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ 1 i))))))
  (recur 1))

(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* 2(/ (+ 1 i) 3))
      1))

; (cont-frac (lambda (i) 1.0) d-euler 1)
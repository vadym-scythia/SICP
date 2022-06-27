#lang sicp

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car represent)
  (define (car-iter represent count)
    (if (= 0 (remainder represent 2))
        (car-iter (/ represent 2) (+ 1 count))
        count))
  (car-iter represent 0))

(define (cdr represent)
  (define (cdr-iter represent count)
    (if (= 0 (remainder represent 3))
        (cdr-iter (/ represent 3) (+ 1 count))
        count))
  (cdr-iter represent 0))
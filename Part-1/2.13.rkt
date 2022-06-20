#lang sicp

; util

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (width interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

(define (make-center-percent center percent)
  (let ((x (/ (* percent center) 100)))
    (make-interval (- center x) (+ center x))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
; main

(define (percent-mul interval)
  (let ((center (/ (+ (upper-bound interval) (lower-bound interval)) 2))
        (width (/ (- (upper-bound interval) (lower-bound interval)) 2)))
    (* (/ width center) 100)))

; test

(define interval1 (make-center-percent 10 0.2))
(define interval2 (make-center-percent 10 0.1))
(percent-mul (mul-interval interval1 interval2))
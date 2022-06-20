#lang sicp

; util

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (width interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

; main

(define (make-center-percent center percent)
  (let ((x (/ (* percent center) 100)))
    (make-interval (- center x) (+ center x))))

(define (center interval)
(/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (percent interval)
  (let ((center (/ (+ (upper-bound interval) (lower-bound interval)) 2))
        (tolerance (- (/ (+ (upper-bound interval) (lower-bound interval)) 2) (lower-bound interval))))
    (/ (* 100 tolerance) center)))
#lang sicp

; util

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; width

(define (width interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

; width-add

(define (width-add interval1 interval2)
  (width (add-interval interval1 interval2)))

(define (width-add-1 interval1 interval2)
  (+ (width interval1)
     (width interval2)))

; width-mult

(define (width-mul interval1 interval2)
  (width (mul-interval interval1 interval2)))

(define (width-mul-1 interval1 interval2)
  (* (width interval1)
     (width interval2)))

; width-div

(define (width-div interval1 interval2)
  (width (div-interval interval1 interval2)))

(define (width-div-1 interval1 interval2)
  (/ (width interval1)
     (width interval2)))

; results

(define test1 (=  (width-add (make-interval 3 5) (make-interval 6 8))
                  (width-add-1 (make-interval 3 5) (make-interval 6 8))))
(define test2 (=  (width-mul (make-interval 3 5) (make-interval 6 8))
                  (width-mul-1 (make-interval 3 5) (make-interval 6 8)))) ; difference always be ~1 (!)
(define test3 (=  (width-div (make-interval 3 5) (make-interval 6 8))
                  (width-div-1 (make-interval 3 5) (make-interval 6 8)))) ; ~0.033 (!)
#lang sicp

; util

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (let ((upper-y (upper-bound y))
        (lower-y (lower-bound y)))
    (if (or (= upper-y 0) (= lower-y 0))
        "ERROR: interval's bounds shouldn't be 0!"
        (mul-interval x
                      (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y)))))))

; Algebra is more abstract then concrete numbers it uses in the variables.
; Thus, common algebra has axioms to define its rule of numbers operating.
; In interval multiplication (algebra for intervals operations) there are no
; identity and inverse element axioms.

; From common number algebra perspectice it should return (1 10), but actually returns (0.1 10)

(define x (make-interval 1 10))
(mul-interval x (div-interval (make-interval 1 1) x))

; common number algebra

(define y 1)
(* y (/ 1 y))

; The algebraic expression made by Daiko(Lem) supposes to have inverse element and identity. 
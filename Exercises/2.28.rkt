#lang sicp

(define x (list (list 1 2) (list 3 4)))
(define y (list x x))

(define (fringe items)
  (define (frng-cycle items result other-items)
    (if (and (null? items) (not (null? other-items)))
        (frng-cycle other-items result (list))
        (if (null? items)
            result
            (if (not (pair? (car items)))
                (frng-cycle (cdr items) (append result (list (car items))) other-items)
                (frng-cycle (car items) result (append (cdr items) other-items))))))
  (frng-cycle items (list) (list)))
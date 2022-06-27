#lang sicp

;(cons 1
 ;     (cons 2
  ;          (cons 3
   ;               (cons 4 nil))))

(define one-through-four (list 1 2 3 4))
(define squares (list 1 4 9 14 25))
(define odds (list 1 3 5 7 11))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (length-iter items)
  (define (length-iterative a count)
    (if (null? a)
        count
        (length-iterative (cdr a) (+ 1 count))))
  (length-iterative items 0))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(list-ref one-through-four 3)
(length one-through-four)
(length-iter one-through-four)
(append squares odds)
(append odds squares)
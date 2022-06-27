#lang sicp

(define (list-ref-modified items n)
  (if (= n 0)
      items
      (list-ref-modified (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair list)
  (if (null? list)
      "Input list is empty"
      (list-ref-modified list (- (length list) 1))))
      
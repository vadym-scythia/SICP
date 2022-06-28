#lang sicp

; utils

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

; count-change with lists

(define (count-change amount coins)
  (cc amount coins))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                     (except-first-denomination coin-values))
                 (cc (- amount
                        (first-denomination coin-values))
                     coin-values)))))

(define (no-more? list-of-coins)
  (if (null? list-of-coins)
      #t
      #f))

(define (except-first-denomination list-of-coins)
  (cdr list-of-coins))

(define (first-denomination list-of-coins)
  (car list-of-coins))

; coins

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define us-coins-other-order (list 25 50 10 1 5))

; tests

(count-change 1 us-coins)
(count-change 100 us-coins)
(count-change 1 uk-coins)
(count-change 100 uk-coins)

; Does the order of the list coin-values affect the answer produced by cc? Why or why not?
; No, as the procedure computes all possible variants.

(count-change 1 us-coins-other-order)
(count-change 100 us-coins-other-order)

#lang sicp

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? a)
  (= (remainder a 2) 0))

(define (fast-multiple a b)
  (fast-multiple-iter a b 0))

(define (fast-multiple-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-multiple-iter (double a) (halve b) c))
        (else (fast-multiple-iter a (- b 1) (+ a c)))))

(define (common-multiple a b) ; to verify, that fast algo is realy fast (and cheap)
  (if (= b 0)
      0
      (+ a (common-multiple a (- b 1)))))
#lang sicp

; test data: (isCarmichael 563 1)
; debug data: (= (expmod 561 563 563) 561)

(define (isCarmichael n a)
  (cond ((> n a)
         (if (= (expmod a n n) a)
             (isCarmichael n (+ a 1))
         true))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n)
  (* n n))
        
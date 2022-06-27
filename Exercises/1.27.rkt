#lang sicp

(define (carmichael-test n)
  (define (carmichael-test-a n a)
    (cond ((> n a)
           (if (= (expmod a n n) a)
               (carmichael-test-a n (+ a 1))
               false))
          (else true)))
  (carmichael-test-a n 1))

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
        
#lang sicp

(define (recursive n)
  (cond ((< n 3) n)
        (else (+ (recursive (- n 1))
                 (recursive (- n 2))
                 (recursive (- n 3))))))

(define (iterative n)
  (iter-act 2 1 0 n))

(define (iter-act a b c count)
  (cond ((< count 0) count)
        ((= count 0) c)
        (else (iter-act (+ a b c) a b (- count 1)))))

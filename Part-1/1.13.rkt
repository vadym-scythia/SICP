#lang sicp

(define (phi n) ; used as note
  (/ (expt (/ (+ 1
                 (sqrt 5))
              2)
           n)
     (sqrt 5)))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (phi-psi-fib n)
  (/ (- (expt (/ (+ 1
                 (sqrt 5))
              2)
           n)
     (expt (/ (- 1
                 (sqrt 5))
              2)
           n))
     (sqrt 5)))

(define (approve? n)
  (if  (= (fib n)
          (phi-psi-fib n))
       "yeah cool"
       "nah"))
      
#lang sicp

(define (inc x)
  (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

(define (test)
  (((double (double double)) inc) 5)) ; if double === 2, then (double (double double)) === 2^2^2 -> 2^4 -> 16
                                      ; inc will be called 16 times, (inc (inc ... (inc 5)...)) -> 21
                                      ; (double1 (f)) -> (f (f))
                                      ; (double2 (double1)) -> (double1 (double1)) -> (double1 (f (f)))) ->(f (f (f (f))))
                                      ; (double3 (double2)) -> (double2 (double1 (double2 (double1)))) -> (double1 (double1 (double1 (double1)))) ->
                                      ; (double1 (double1 (double1 (f (f))))) -> (double1 (double1 (f (f (f (f)))))) ->
                                      ; (double1 (f (f (f (f (f (f (f (f))))))))) -> (f (f (f (f (f (f (f (f (f (f (f (f (f (f (f (f))))))))))))))))


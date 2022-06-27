#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10) -> 1024. Ten times 2, after 1 - 1.
; (A 2 4) -> 65536. Recursive stack growing 4 times.
; (A 3 3) -> 65536.

; This function is about growing of y parameter with a help of recursive functions incrementing on stack.
; More func A calling with x = 0 we have, bigger y parameter (and result) we grow.

(define (f n) (A 0 n)) ; -> 2*n

(define (g n) (A 1 n)) ; -> 0 for n = 0, else 2^n. What's the hell with 2^n, where n = 256???

(define (h n) (A 2 n)) ; -> 0 for n = 0, else 2^2^2... n-1 times.

(define (k n) (* 5 n n)) ; -> 5n^2.
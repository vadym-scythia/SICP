#lang sicp

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (f g)
  (g 2)) ; procedure recieves its body, which is combination, but not a procedure.
         ; (f f) -> (f 2) -> ((g 2) 2) -> (2 2)
         ; (f square) -> (square 2) -> ((* x x) 2) -> (* 2 2)
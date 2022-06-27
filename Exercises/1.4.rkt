#lang sicp

; b is always positive number
; first operator in function's body, then operator to params

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
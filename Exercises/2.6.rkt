#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x))))) ; ->
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))) ; ->
; (lambda (f) (lambda (x) (f (f x)))) ; ->
(define one (lambda (f) (lambda (x) (f (f x))))) ; ->
; (add-1 one) ; ->
; (lambda (f) (lambda (x) (f ((one f) x)))) ; ->
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f (f x)))) f) x)))) ; ->
; (lambda (f) (lambda (x) (f (f (f x)))))
(define two (lambda (f) (lambda (x) (f (f (f x))))))

(define (add m n) (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define add1 (lambda (x) (+ x 1)))

(define test1 (((add one two) add-1) 0))



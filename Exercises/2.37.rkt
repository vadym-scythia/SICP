#lang sicp

; util

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda seq (car (car seq))) seqs))
            (accumulate-n op init (map (lambda seq (cdr (car seq))) seqs)))))

; solution

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda m-elem (dot-product (car m-elem) v)) m))
  
(define (transpose mat)
  (accumulate-n cons (list) mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-elem) (matrix-*-vector cols m-elem)) m)))

; inputs

(define vector1 (list 1 2))
(define vector2 (list 3 4))
(define matrix1 (list vector1 vector2))
(define matrix2 (list vector2 vector1))

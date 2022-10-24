#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda t-elem (if (not (pair? (car t-elem))) 1
                          (count-leaves (car t-elem))))
                   t)))

; test
(define x (cons (list 1 2 3 4 (list 1 2)) (list 3 4)))
(count-leaves x)
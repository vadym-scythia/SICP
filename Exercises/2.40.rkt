#lang sicp

(define (enumerate-interval low high)
  (if (> low high)
      (list)
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) (list))
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; result

(define n 5)

(define (unique-pair pair)
  (not (= (car pair) (cadr pair))))

(define (unique-pairs n)
  (filter unique-pair
          (flatmap (lambda (i) (map (lambda (j) (list i j))
                                    (enumerate-interval 1 i)))
                   (enumerate-interval 1 n))))

(unique-pairs n)
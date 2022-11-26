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
(define n 3)
(define s 4)

(define (is-equal? sequence s)
  (= (+ (car sequence) (cadr sequence) (cadr (cdr sequence))) s))

(define (filter-with-param predicate sequence param)
  (cond ((null? sequence) (list))
        ((predicate (car sequence) param)
         (cons (car sequence)
               (filter-with-param predicate (cdr sequence) param)))
        (else (filter-with-param predicate (cdr sequence) param))))

(define (triplet n s)
  (filter-with-param is-equal?
                     (flatmap (lambda (i) (list i (map (lambda (j) (list j (map (lambda (k) k)
                                                                        (enumerate-interval 1 n))))
                                               (enumerate-interval 1 n))))
                              (enumerate-interval 1 n))
                     s))

(triplet n s)

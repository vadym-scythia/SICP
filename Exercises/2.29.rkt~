#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (cycle items result other-items last-item)
    (if (and (null? items) (not (null? other-items)))
        (cycle other-items result (list) #f)
        (if (null? items)
            result
            (if (not (pair? items))
                (cycle (list) (+ items result) other-items #f)
                (if (null? other-items)
                    (if last-item
                        (cycle (branch-structure items) result other-items #f)
                        (if (equal? (length items) 1)
                            (cycle (left-branch items) result other-items #t)
                            (cycle (left-branch items) result (append (cdr items) other-items) #f)))
                    (cycle (branch-structure items) result other-items #f))))))
  (cycle mobile 0 (list) #f))

; new implm

(define (testw mobile)
  (define (cycle mobile store weight)
    (if (pair? (branch-structure (left-branch mobile)))
        (cycle (branch-structure (left-branch mobile)) (right-branch mobile) weight)
        (if (and (null? store) (null? (right-branch mobile)) (> weight 0))
            (+ weight (branch-structure (left-branch mobile)))
            (if (null? store)
                (cycle (make-mobile (right-branch mobile) (list)) (list) (+ weight (branch-structure (left-branch mobile))))
                (if (null? (car (car (cdr store))))
                    (cycle (make-mobile (car store) (list)) (list) weight)
                    (cycle (make-mobile (car store) (car (car (cdr store)))) (cdr (car (cdr store))) (+ weight (branch-structure (left-branch mobile)))))))))
  (cycle mobile (list) 0))
    

; tests

(define test1 (left-branch (make-mobile (make-branch 3 7)
                                       (make-branch 2 5))))
(define test2 (right-branch (make-mobile (make-branch 3 7)
                                       (make-branch 2 5))))
(define test3 (branch-length test1))
(define test4 (branch-structure test1))

(define test5 (testw (make-mobile (make-branch 2 3) (make-branch 4 5))))
(define test6 (testw (make-mobile (make-branch 2 3) (make-branch 4 (make-mobile (make-branch 2 3) (make-branch 4 5))))))
;(define test7 (testw (make-mobile (make-branch 2 (make-mobile (make-branch 2 3) (make-branch 4 5))) (make-branch 4 5))))
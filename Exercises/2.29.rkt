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
        (if (null? store)
            (cycle (branch-structure (left-branch mobile)) (right-branch mobile) weight)
            (cycle (branch-structure (left-branch mobile)) (make-mobile (right-branch mobile) store) weight))
        (if (and (null? store) (null? (right-branch mobile)) (> weight 0))
            (+ weight (branch-structure (left-branch mobile)))
            (if (null? store)
                (cycle (make-mobile (right-branch mobile) (list)) (list) (+ weight (branch-structure (left-branch mobile))))
                (if (null? (right-branch mobile))
                    (if (and (pair? (right-branch store)) (pair? (left-branch store)))
                        (cycle store (list) (+ weight (branch-structure (left-branch mobile))))
                        (cycle (make-mobile store (list)) (list) (+ weight (branch-structure (left-branch mobile)))))
                    (cycle (make-mobile (right-branch mobile) (list)) store (+ weight (branch-structure (left-branch mobile)))))))))
  (cycle mobile (list) 0))
    

; tests

;(define test1 (left-branch (make-mobile (make-branch 3 7)
 ;                                      (make-branch 2 5))))
;(define test2 (right-branch (make-mobile (make-branch 3 7)
  ;                                     (make-branch 2 5))))
;(define test3 (branch-length test1))
;(define test4 (branch-structure test1))

(define test5 (testw (make-mobile (make-branch 2 3) (make-branch 4 5))))
(define test6 (testw (make-mobile (make-branch 2 3) (make-branch 4 (make-mobile (make-branch 2 3) (make-branch 4 5))))))
(define test7 (testw (make-mobile (make-branch 1 (make-mobile (make-branch 2 3) (make-branch 4 5))) (make-branch 6 7))))
(define test8 (testw (make-mobile (make-branch 2 (make-mobile (make-branch 2 (make-mobile (make-branch 2 3) (make-branch 4 5))) (make-branch 4 6))) (make-branch 4 7))))
(define test9 (testw (make-mobile (make-branch 1 (make-mobile (make-branch 2 (make-mobile (make-branch 3 4)
                                                                                          (make-branch 5 6)))
                                                              (make-branch 7 (make-mobile (make-branch 8 9)
                                                                                          (make-branch 10 11)))))
                                  (make-branch 12 (make-mobile (make-branch 13 14)
                                                               (make-branch 15 16))))))

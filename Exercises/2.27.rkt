#lang sicp

(define x (list (list 1 2) (list 3 4)))
(define y (list 1 2 (list 3 4) (list 5 6) 7 8))
(define z (list 1 2 (list 3 4) (list 5 (list 7 8)) 9)) ; it seems it is failing,
                                                       ; when it has list in the list in the list,
                                                       ; but it isn't priority rigth now.
                                                       ; last-item is not working properly
(define (deep-reverse items)
  (define (deep-rvrs-cycle items rvrsd-items other-items last-item)
    (if (and (null? items) (not (null? other-items)))
        (deep-rvrs-cycle other-items rvrsd-items (list) #f)
        (if (null? items)
            rvrsd-items
            (if (pair? (car items))
                (if (null? (cdr items))
                    (deep-rvrs-cycle (car items)
                                     (cons (list) rvrsd-items)
                                     (append (cdr items) other-items)
                                     #t)
                    (deep-rvrs-cycle (car items)
                                     (cons (list) rvrsd-items)
                                     (append (cdr items) other-items)
                                     #f))
                (if (or (not (null? other-items)) last-item)
                    (if last-item
                        (deep-rvrs-cycle (cdr items)
                                     (cons (cons (car items) (car rvrsd-items)) (cdr rvrsd-items))
                                     other-items
                                     #t)
                        (deep-rvrs-cycle (cdr items)
                                         (cons (cons (car items) (car rvrsd-items)) (cdr rvrsd-items))
                                         other-items
                                         #f))
                    (deep-rvrs-cycle (cdr items)
                                     (append (list (car items)) rvrsd-items)
                                     other-items
                                     #f))))))
  (deep-rvrs-cycle items (list) (list) #f))

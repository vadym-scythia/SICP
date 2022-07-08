#lang sicp

(define (square x)
  (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; when nil in the end of the cons expression, then it fits default list's last item (nil itself).
; when nil in the beginning of the cons expr, then it creates pair, where the first element is nil.
; in the first case, nil is cut off, as it is the same as default value.
; std lib has a function reverse:
(display "with reverse: ")
(reverse (square-list (list 1 2 3 4)))

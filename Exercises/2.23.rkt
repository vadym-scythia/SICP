#lang sicp

(define (foreach proc items)
  (proc (car items)) ; may add a validation for empty list
  (if (not (null? (cdr items)))
      (foreach proc (cdr items))))

(display "lib for-each:")
(for-each (lambda (x) (newline) (display x))
          (list 2 3 4))
(display "\ncustom for-each:")
(foreach (lambda (x) (newline) (display x))
          (list 2 3 4))
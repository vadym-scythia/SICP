#lang sicp

(define (check root m)
  (if (and (not (or (= root 1)
                    (= root (- m 1))))
           (= (remainder (* root root) m) 1))
      0
      (remainder (* root root) m)))

(define (expmod-checked base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (check (expmod-checked base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod-checked base (- exp 1) m))
                    m))))

(define (miller-rabin-check n)
  (define (try-it a)
    (= (expmod-checked a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-test n)
  (define (is-prime? n times)
    (cond ((= times 0) true)
          ((miller-rabin-check n) (is-prime? n (- times 1)))
          (else false)))
  (is-prime? n (floor (/ n 2))))

#lang sicp

; main

(define (search-for-fast-primes start-number times)
  (find-first-three-odd-primes (+ start-number 1) 0 times))

(define (find-first-three-odd-primes start-number count times)
  (if (< count 3)
      (if (= (remainder start-number 2) 0)
          (find-first-three-odd-primes (+ start-number 1) count times)
          (find-first-three-odd-primes (+ start-number 1) (+ count (start-prime-test start-number (runtime) times)) times))))
  
; time and display

(define (start-prime-test number start-time times)
  (cond ((fast-prime? number times)(report-prime number (- (runtime) start-time)) 1) ; returning value could be refactored, out of function
        (else 0)))

(define (report-prime number elapsed-time)
  (newline)
  (display number)
  (display " *** ")
  (display elapsed-time)
  (display " ms"))

; fast-prime?

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((ferma-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (ferma-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m);
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (n-expmod base exp m);
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (*  (expmod base (/ exp 2) m)
                        (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
; help

(define (square n)
  (* n n))

; Conclusion: order of evaluation (applicative-order).
; In n-expmod we evaluate (* (expmod base (/ exp 2) m) twice and then multiply the results of evaluations,
; however in expmod we evaluate (* (expmod base (/ exp 2) m) for one time, and then multiply the result on itself.
; Complexity from (log n) becomes (n), as the work to do doubles.
#lang sicp

; main

(define (search-for-primes start-number)
  (find-first-three-odd-primes (+ start-number 1) 0))

(define (find-first-three-odd-primes start-number count)
  (if (< count 3)
      (if (= (remainder start-number 2) 0)
          (find-first-three-odd-primes (+ start-number 1) count)
          (find-first-three-odd-primes (+ start-number 1) (+ count (start-prime-test start-number (runtime)))))))
  
; time and display

(define (start-prime-test number start-time)
  (cond ((prime? number)(report-prime number (- (runtime) start-time)) 1) ; returning value could be refactored, out of function
        (else 0)))

(define (report-prime number elapsed-time)
  (newline)
  (display number)
  (display " *** ")
  (display elapsed-time)
  (display " ms"))

; prime?

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square a)
  (* a a))

; test results

#|
> (search-for-primes 1000)

1009 *** 1 ms
1013 *** 2 ms
1019 *** 2 ms
> (search-for-primes 10000)

10007 *** 5 ms
10009 *** 6 ms ; 2 * squareRoot(10) ~= 6.3
10037 *** 5 ms
> (search-for-primes 100000)

100003 *** 15 ms
100019 *** 26 ms ; 6 * squareRoot(10) ~= 19 !!
100043 *** 14 ms
> (search-for-primes 1000000)

1000003 *** 45 ms
1000033 *** 45 ms ; 26 * squareRoot(10) ~= 82 !!!!!
1000037 *** 47 ms

It seems like this programm non proportionally uses time to steps.
|#
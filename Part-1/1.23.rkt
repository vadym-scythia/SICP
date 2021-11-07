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

; prime? with next

(define (prime? n)
  (= n (smallest-divisor n)))
  
(define (smallest-divisor n)
  (find-divisor-inline n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square a)
  (* a a))

; next

(define (next number)
  (if (= number 2)
      3
      (+ number 2)))

; find-divisor-inline

(define (find-divisor-inline n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-inline
               n
               (if (= test-divisor 2)
                   3
                   (+ 2 test-divisor))))))

; test results

#|

results from 1.22:

1009 *** 1 ms
1013 *** 2 ms
1019 *** 2 ms

10007 *** 5 ms
10009 *** 6 ms
10037 *** 5 ms

100003 *** 15 ms
100019 *** 26 ms ; 6 * squareRoot(10) ~= 19 !!
100043 *** 14 ms

1000003 *** 45 ms
1000033 *** 45 ms ; 26 * squareRoot(10) ~= 82 !!!!!
1000037 *** 47 ms

current results:

1009 *** 1 ms
1013 *** 2 ms
1019 *** 1 ms

10007 *** 3 ms
10009 *** 5 ms
10037 *** 3 ms

100003 *** 10 ms
100019 *** 11 ms
100043 *** 10 ms

1000003 *** 31 ms
1000033 *** 35 ms
1000037 *** 32 ms

Conclusion: the speedup is lower then x2, seems the "next" function call and if statement are influencing.

current results after inlining "next":

1009 *** 1 ms
1013 *** 2 ms
1019 *** 1 ms

10007 *** 3 ms
10009 *** 4 ms
10037 *** 3 ms

100003 *** 8 ms
100019 *** 8 ms
100043 *** 9 ms

1000003 *** 28 ms
1000033 *** 28 ms
1000037 *** 29 ms

Conclusion: seems inlining "next" improved results.

Other interpreter optimizations?
|#
  
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
  (cond ((fast-prime-inline? number (+ 1 (random (- number 1))) times)(report-prime number (- (runtime) start-time)) 1) ; returning value could be refactored, out of function
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

; help

(define (square n)
  (* n n))

; ferma-test-inline

(define (fast-prime-inline? n a times) ; a => (+ 1 (random (- n 1)))
  (cond ((= times 0) true)
        ((= (expmod a n n) a) (fast-prime-inline? n (+ 1 (random (- n 1))) (- times 1)))
        (else false)))

; test results

#|

result from search-for-primes (exc. 1.22)

1009 *** 1 ms
1013 *** 2 ms
1019 *** 2 ms

result from modified search-for-fast-primes (exc. 1.23)

1009 *** 1 ms
1013 *** 2 ms
1019 *** 1 ms

result from search-for-fast-primes, each number tested for 3 times (exc. 1.23)

1009 *** 6 ms
1013 *** 7 ms
1019 *** 7 ms


10007 *** 5 ms
10009 *** 6 ms
10037 *** 5 ms

10007 *** 3 ms
10009 *** 5 ms
10037 *** 3 ms

10007 *** 9 ms
10009 *** 11 ms
10037 *** 8 ms


100003 *** 15 ms
100019 *** 26 ms ; 6 * squareRoot(10) ~= 19 !!
100043 *** 14 ms

100003 *** 10 ms
100019 *** 11 ms
100043 *** 10 ms

100003 *** 10 ms (!)
100019 *** 9 ms  (!)
100043 *** 9 ms  (!)


1000003 *** 45 ms
1000033 *** 45 ms ; 26 * squareRoot(10) ~= 82 !!!!!
1000037 *** 47 ms

1000003 *** 31 ms
1000033 *** 35 ms
1000037 *** 32 ms

1000003 *** 11 ms (!)
1000033 *** 11 ms (!)
1000037 *** 11 ms (!)

Conclusion: difference between search-for-fast-primes(1000 3) and search-for-fast-primes(1000000 3) should be only in ~2 times, as this algo is log(n).
IRL we see differences, as we have a lot of infrastructure stuff, for example: additional function calls.

Inlining gave a small benefit, ~1 ms max. Need more effective ways for optimization.

|#
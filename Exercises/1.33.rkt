#lang sicp

; filtered-accumulate

(define (filtered-accumulate predicate? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (predicate? a) (term a) null-value)
       (filtered-accumulate predicate? combiner null-value term (next a) next b))))

; prime?

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

; gcd

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; base

(define (inc n) (+ n 1))

(define (identity x) x)

; result

(define (filter-accum-square a b)
  (filtered-accumulate prime? + 0 square a inc b)) ; function prime? counts 1 as prime number

(define (filter-accum-gcd n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))
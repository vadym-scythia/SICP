#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x h h)) ; kh from (a + kh)
  (* (+ (f a)
        (* 2 (sum f a       next b)) ; even terms
        (* 4 (sum f (+ a h) next b)) ; odd terms
        (f b))
     (/ h 3)))

(define (cube x) (* x x x))
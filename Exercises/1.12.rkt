#lang sicp

; Pascal's triangle: n - row, k - column of element

(define (pascal-trngl n k)
  (if (or (= k 0)
          (= n k))
      1
      (+ (pascal-trngl (- n 1) (- k 1))
         (pascal-trngl (- n 1) k))))
                       

(define (binom-coeff n k) ; use this non-recursive proc to check the answer, also try to abuse this and recursive procs
  (/ (factorial n 1)
     (* (factorial k 1)
        (factorial (- n k) 1))))

(define (factorial x sum)
  (if (< x 1)
      sum
      (factorial (- x 1) (* sum  x))))
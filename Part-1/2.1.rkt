#lang sicp

; need

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; rational numbers

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (or (and (> n 0)
                 (> d 0))
            (and (< n 0)
                 (< d 0)))
        (cons (/ n g) (/ d g))
        (cons (- (abs (/ n g))) (abs (/ d g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

; operations with rational numbers

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; util

(define (print-rat x)
  ;(newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

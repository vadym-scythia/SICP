#lang sicp

; point

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

; segment

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; rectangle

(define (make-rectangle a b)
  (cons (cons a
              (make-segment (make-point
                             (x-point (start-segment a))
                             (+ (y-point (start-segment a)) 2))
                            (make-point
                             (x-point (end-segment a))
                             (+ (y-point (end-segment a)) 2))))
        (cons b
              (make-segment (make-point
                             (+ (x-point (start-segment b)) 2)
                             (y-point (start-segment b)))
                            (make-point
                             (+ (x-point (end-segment b)) 2)
                             (y-point (end-segment b)))))))

(define (a-oppos-sides rectangle)
  (car rectangle))

(define (b-oppos-sides rectangle)
  (cdr rectangle))

(define (a-up-side rectangle)
  (car (car rectangle)))

(define (a-down-side rectangle)
  (cdr (car rectangle)))

(define (b-left-side rectangle)
  (car (cdr rectangle)))

(define (b-right-side rectangle)
  (cdr (cdr rectangle)))

; P(rectangle), S(rectangle)

(define (segment-length segment)
  (let ((xA (x-point (start-segment segment)))
        (xB (x-point (end-segment segment)))
        (yA (y-point (start-segment segment)))
        (yB (y-point (end-segment segment))))
    (sqrt (+ (expt 2 (- xB xA))
             (expt 2 (- yB yA))))))

(define (rectangle-perimeter rectangle)
  (* 2
     (+ (segment-length (a-up-side rectangle))
        (segment-length (b-left-side rectangle)))))

(define (rectangle-area rectangle)
  (* (segment-length (a-up-side rectangle))
     (segment-length (b-left-side rectangle))))

; tests

(define test1 (make-rectangle (make-segment (make-point 1 2) (make-point 3 2)) (make-segment (make-point 1 2) (make-point 1 4))))
(define test2 (a-oppos-sides test1))
(define test3 (b-oppos-sides test1))
(define test4 (a-up-side test1))
(define test5 (a-down-side test1))
(define test6 (b-left-side test1))
(define test7 (b-right-side test1))

(define test8 (segment-length (make-segment (make-point 1 2) (make-point 3 2))))
(define test9 (rectangle-perimeter (make-rectangle (make-segment (make-point 1 2) (make-point 3 2)) (make-segment (make-point 1 2) (make-point 1 4)))))
(define test10 (rectangle-area (make-rectangle (make-segment (make-point 1 2) (make-point 3 2)) (make-segment (make-point 1 2) (make-point 1 4)))))

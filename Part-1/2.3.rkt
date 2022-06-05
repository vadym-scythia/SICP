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

; rectangle (represantation based on points)

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

(define (heights rectangle)
  (car rectangle))

(define (widths rectangle)
  (cdr rectangle))

(define (height rectangle)
  (car (car rectangle)))

(define (width rectangle)
  (car (cdr rectangle)))

(define (segment-length segment)
  (let ((xA (x-point (start-segment segment)))
        (xB (x-point (end-segment segment)))
        (yA (y-point (start-segment segment)))
        (yB (y-point (end-segment segment))))
    (sqrt (+ (expt 2 (- xB xA))
             (expt 2 (- yB yA))))))

; another rectangle (represantation based on corner point, height, weight and angle)

(define (make-rectangle2 origin height width angle)
  (cons (cons height width) (cons origin angle)))

(define (height2 rectangle)
  (car (car rectangle)))

(define (width2 rectangle)
  (cdr (car rectangle)))

(define (segment-length2 segment)
  segment)

; P(rectangle), S(rectangle)

(define (rectangle-perimeter rectangle)
  (* 2
     (+ (segment-length (height rectangle))
        (segment-length (width rectangle)))))

(define (rectangle-area rectangle)
  (* (segment-length (height rectangle))
     (segment-length (width rectangle))))

(define (rectangle-perimeter2 rectangle)
  (* 2
     (+ (segment-length2 (height2 rectangle))
        (segment-length2 (width2 rectangle)))))

(define (rectangle-area2 rectangle)
  (* (segment-length2 (height2 rectangle))
     (segment-length2 (width2 rectangle))))

; tests

(define test1 (make-rectangle (make-segment (make-point 1 2) (make-point 3 2)) (make-segment (make-point 1 2) (make-point 1 4))))
(define test2 (heights test1))
(define test3 (widths test1))
(define test4 (height test1))
(define test5 (width test1))
(define test6 (segment-length test4))

(define test7 (make-rectangle2 (make-point 1 2) 2.23606797749979 2.23606797749979 0.2))
(define test8 (height2 test7))
(define test9 (width2 test7))
(define test10 (segment-length2 test8))

(define test11 (rectangle-perimeter test1))
(define test12 (rectangle-area test1))
(define test13 (rectangle-perimeter2 test7))
(define test14 (rectangle-area2 test7))
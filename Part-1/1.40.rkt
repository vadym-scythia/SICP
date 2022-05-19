#lang sicp

(define tolerance 0.00000000001)

(define dx 0.00000000001)

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(define (cubic1 a b c x)
  (+ (cube x) (* a (square x)) (* b x) c))

(define (cubic a b c)
  (newtons-method (lambda (x) (+ (cube x) (* a (square x)) (* b x) c))
                  1.0))

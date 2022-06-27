#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; applicative-order eval:

; 1. (gcd 206 40)
; 2. if (= 40 0)
; 3. (gcd 40 (remainder 206 40))
; 4. (gcd 40 6)
; 5. if (= 6 0)
; 6. (gcd 6 (remainder 40 6))
; 7. (gcd 6 4)
; 8. if (= 4 0)
; 9. (gcd 4 (remainder 6 4))
; 10. (gcd 4 2)
; 11. if (2 = 0)
; 12. (gcd 2 (remainder 4 2))
; 13. (gcd 2 0)
; 14. if (= 0 0)
; 15. 2

; normal-order eval:

; 1. (gcd 206 40)
; 2. if (= 40 0)
; 3. (gcd 40 (remainder 206 40))
; 4. if (= (remainder 206 40) 0)
; 5. if (= 6 0)
; 6. (gcd (remainder 206 40) (remainder 40 (remainder 206 40))
; 7. if (= (remainder 40 (remainder 206 40)) 0)
; 8. if (= (remainder 40 6) 0)
; 9. if (= 4 0)
; 10. (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; 11. if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
; 12. if (= (remainder (remainder 206 40) (remainder 40 6)) 0)
; 13. if (= (remainder 6 4) 0)
; 14. if (= 2 0)
; 15. (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; 16. if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
; 17. if (= (remainder (remainder 40 6) (remainder (remainder 206 40) (remainder 40 6))) 0)
; 18. if (= (remainder 4 (remainder 6 4)) 0)
; 19. if (= (remainder 4 2) 0)
; 20. if (= 0 0)
; 21. (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; 22. (remainder (remainder 206 40) (remainder 40 6))
; 23. (remainder 6 4)
; 24. 2

#lang racket

(provide sum-of-squares square-of-sums difference)

(define sum-of-items
  (lambda (n trans-proc)
    (define sum-of-items-iter
      (lambda (n rst)
        (if (= n 0)
            rst
            (sum-of-items-iter (- n 1) (+ rst (trans-proc n))))))
    (sum-of-items-iter n 0)))

(define sum-of-squares
  (lambda (n)
    (sum-of-items n (lambda (x) (* x x)))))

(define square-of-sums
  (lambda (n)
    (expt (sum-of-items n (lambda (x) x)) 2)))

(define difference
  (lambda (n)
    (- (square-of-sums n) (sum-of-squares n))))

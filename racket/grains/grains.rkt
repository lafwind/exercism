#lang racket

(provide square total)

(define square
  (lambda (n)
    (expt 2 (- n 1))))

(define total
  (lambda ()
      (define total-iter
        (lambda (n rst)
          (if (= n 0)
              rst
              (total-iter (- n 1) (+ rst (square n))))))
    (total-iter 64 0)))

#lang racket

(provide perfect-numbers)

(define perfect-numbers
  (lambda (n)
    (filter perfect? (range 1 (+ n 1)))))

(define find-factors
  (lambda (n)
    (filter (lambda (x)
              (zero? (modulo n x))) (range 1 n))))

(define perfect?
  (lambda (n)
    (= (apply + (find-factors n)) n)))

#lang racket

(provide leap-year?)

(define leap-year?
  (lambda (year)
    (or (and (= 0 (remainder year 4))
             (not (= 0 (remainder year 100))))
        (= 0 (remainder year 400)))))

#lang racket

(provide hello)

(define hello
  (lambda ([name "World"])
    (string-append "Hello, " name "!")))

#lang racket

;; LAB 7 PROBLEMS BELOW. First, we will learn about lambda.
;; lambda
;; We know how to create a function. For example
(define (square n)
  (* n n))

;; This function is called 'square', takes a number n and returns its square.
;; It turns out we can also create a function without a name. This turns out
;; to be quite useful.

;; Introducing lambda.
;; 'lambda' could have been called 'make-function'.
;; That is exactly what it does.

;; W will illustrate this with the square function
(lambda (n) (* n n))
;; This evaluates to  a function that does exactly what square does.
;; If we wanted to, we could even define a function square2, like this:
(define square2 (lambda (n) (* n n)))
;; Then we could use it just as we use square
(square2 3) ;; This will evaluate to 9

;;But the most common use of lambda is with functions like map and filter.
(define numbers (list 1 2 3 4 5 6 7 8 9 10))
(map (lambda (n) (* n n)) numbers) ;; This will evaluate to a list of the squares from 1 to 10

;; another example
(filter (lambda (n) (> n 5)) numbers)

;; LAB 7 PROBLEMS

;; PROBLEM 1
;; Create a function with lambda that takes a number and evaluates to its cube

;; PROBLEM 2
;; Create a function with lambda that tests if a number is even. It should return a Boolean (#t or #f)

;; Problem 3
;; Use the function from PROBLEM 2 to filter the list of numbers from 1 to 10 to evaluate to the even ones.


;; Problem 4
;; Create a struct called book. The fields should be id, title, author and year-published.
;; Now create 4 books. (4 instances of the book struct)
;; Finally, filter a list of the 4 books by whether the year-published is greater than 1980 (Make sure that when you
;; create the 4 books, some of them have year-published greater than 1980 - so we can test it.)

;; Problem 5
;; A lambda can also have more than one argument
;; example
(lambda (m n) (+ m n))

;; Problem 6
;; Using lambda, create a function that takes two books and returns the one which was published earlier.


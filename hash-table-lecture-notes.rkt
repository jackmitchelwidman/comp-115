#lang racket

;; Wednesday, April 23 Lecture

;; Topic 1 - mutability vs immutability
;; So far, we never change variables.
;;  Functional Programing = immutable (never change any variables)
;;  Imperative Programming = mutable (can change some variables)

;; In parallel programming, its much easier with functional programming.

(define x 1)
;(display x)
(set! x 2) ;; This sets x to 2. NOTE: This nevers happens in functional programming
;(display x)

(set! x "hello")
(displayln x)


(define s "hello")
(set! s "goodbye")

(define-struct person [name age])
(define p (make-person "Karl" 29))
(set! p (make-person "Karl" 30))
;(person-age p)
(define z 1)
(set! z 5)


;; Topic 2 - for loop
;; saw we have a list of numbers
(define numbers '(1 2 3 4 5))
;(map sqr numbers)  ;; FP

;; New topic - for loop
;(for ([k numbers])
;  (displayln k))

;; factorial - factorial n is the product n*(n-2)*(n-2)...* 1
;3! = 6

;;We need a function that builds a list
;; build-list
;(define some-numbers (build-list 5 values))
;some-numbers

(define some-numbers (build-list 5 add1))

(define (build-list-of-numbers n)
  (build-list n add1))

;(build-list-of-numbers 100)


(define (factorial n)
  (define result 1)
  (for ([k (build-list n add1)])
    (set! result (* result k)))
  result)
  
;; Trace through this function, by hand, each step and notice how result changes.


;(factorial 3)

;(map factorial (build-list 10 add1))
;(factorial 10000)

;; numbers is a list
(define (sum numbers)
  (define result 0)
  (for ([k numbers])
    (set! result (+ result k)))
  result)

(sum '(1 2 3 4))

(define (product numbers)
  (define result 1)
  (for ([k numbers])
    (set! result (* result k)))
  result)

;;If I perceive that these two functions are, in some way, the same, we should be able to write the as one function.

;; This function is a higher level of abstraction than others we have had so far. 
(define (combine numbers initial-number operation)
  (define result initial-number)
  (for ([k numbers])
    (set! result (operation result k)))
  result)

(define (my-product numbers)
  (combine numbers 1 *))
 
  
  (my-product '(3 5 7))

(define (my-sum numbers)
  (combine numbers 0 +))

(my-sum '(1 2 3))

;;PREPARATION FOR FINAL - Think of other functions you can get with combine. Think out of the box, for examle, you can use strings and booleans

;; examples - sum, factorial, product combine
;; Topic 3  Hash Map - mutable

;;hash map, map, dictionary
;; 1 -> "a"
;; 2 -> "b"
;; 3 -> "c"

;; The first thing is a 'key' and the second one is the 'value'
;; They are called 'key-value pairs
;; Mutable hash table

(define my-table (make-hash))


(define her-table (make-hash (list '(1 . "a") '(2 . "b"))))

(hash-set! her-table 2 "z")

her-table


;; Topic 4 Problem 7 on hw
;; Topic 5 -  mutable structs
;(define-struct person (name age) #:mutable)

;; New Topic  'Order in Chaos'











#lang racket
; Lab 9 -  Hash Maps

;; Problem 1 
;; Create a function called squares-hash-sum, which takes a number n, and returns a mutable hash map  where the keys
;; are the numbers 1 to n, and the values are the squares of those numbers. Remember we can use (build-list n add1)
;; to create a list of the numbers 1 to n.

;; So 1 goes to 1
;;    2 goes to 4
;;    3 goes to 9
;; etc


;; Problem 2
;; Create a function called sum, that takes a list of numbers and returns their sum. We saw this in class and we need it
;; here for Problem 3


;; Problem 3
;; Create a function called values, that takes a hash map where the values are numbers and returns the sum of the values.
;; You can use the sum function from Problem 2. Then apply it to the hash map squares-hash, from Problem 1. Remember the
;; built-in function hash-values


;;Problem 4
;; For this problem, we need the function hash-update! To review this function, 
;; let's create a simple hash table and update it with hash-update!
(define numbers-with-names (make-hash (list (cons 1 "one") (cons 2 "two") (cons 3 "three"))))
;; You could also write (define numbers-with-names (make-hash (list '(1 . "one") '(2 . "two") '(3 . "three")))

;; Now let's modify it so that 3 gets mapped to "THREE".
(hash-update! numbers-with-names 3 (lambda (word) (string-upcase word)))
;; Notice the last argument to hash-update! is a function that acts on the value of the key you supplied

;;And let's see the result
(displayln numbers-with-names)


;; Load the file words (or words.txt) into Racket and create a list with it called word-list.
;; Using a hash map, create a function called all-anagrams, that takes a list of words, and returns
;; a list of the anagrams of each word. (So the result is a list of lists)
;; Hint. Use sort, to create the keys. Then call all-anagrams on word-list.



;;Problem 5
;; Write a function called char-frequencies, that takes a string and returns a hash map that maps characters in
;; the string to their frequency.
;; HINT - The function supplied to hash-update! has to take a number and add 1 to it BUT, you have to handle
;; the case where the character you are considering has not yet occurred so it won't have a value yet. In this
;; case, the function returns 0. This will mean you can use an if statement in your update function. 



;; Problem 6
;; Write a function called max-of-ints, that takes a list of nubers and returns their max.

  
  ;; Problem 7
;; Create a function called max-frequency that takes a string, and returns the max frequency of any character










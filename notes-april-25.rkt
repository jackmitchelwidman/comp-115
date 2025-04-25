#lang racket
; Lab 9 -  Hash Maps


;; mutable maps




;; Problem 1 
;; Create a variable called squares-hash, which is a hash that maps the numbers 1 to n, to their squares.
;;  Remember we can use (build-list n add1)
;; to create a list of the numbers 1 to n.

;; So 1 goes to 1
;;    2 goes to 4
;;    3 goes to 9
;; etc

;; Say n = 3
(define squares-hash (make-hash (list (cons 1 1) (cons 2 4) (cons 3 9))))
squares-hash

(hash-values squares-hash)
(hash-keys squares-hash)

;(hash-set! squares-hash 2 5)
(hash-update! squares-hash 2 sqr)
squares-hash

;; Sometimes a list is called a linked list.
(define numbers (build-list 1000000 add1))
(take numbers 100)




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
(hash-update! numbers-with-names 3 string-upcase)
;; Notice the last argument to hash-update! is a function that acts on the value of the key you supplied

;;And let's see the result
(displayln numbers-with-names)

;abcc cbaa   two words are anagrams if and only if they have the same characters and the same frequencies.

;; use the sorted words as keys

(define word-list (file->lines "/Users/jackwidman/million-words"))
(length word-list)

(define (all-anagrams word-list)
  (define anagrams-hash (make-hash))
  (for ([word word-list])
    (define sorted-word (list->string (sort (string->list word) char<?)))
    (hash-update! anagrams-hash sorted-word (lambda (words) (cons word words)) '()))
  (filter (lambda (lst) (> (length lst) 1)) (hash-values anagrams-hash))) 

;(all-anagrams word-list)




;; Load the file words (or words.txt) into Racket and create a list with it called word-list.
;; Using a hash map, create a function called all-anagrams, that takes a list of words, and returns
;; a list of the anagrams of each word. (So the result is a list of lists)
;; Hint. Use sort, to create the keys. Then call all-anagrams on word-list.
;;
;; we might first think to map words to their anagrams.



;;Problem 5
;; Write a function called char-frequencies, that takes a string and returns a hash map that maps characters in
;; the string to their frequency.
;; HINT - The function supplied to hash-update! has to take a number and add 1 to it BUT, you have to handle
;; the case where the character you are considering has not yet occurred so it won't have a value yet. In this
;; case, the function returns 0. This will mean you can use an if statement in your update function. 

;; we want to map a character to its frequency


(define (char-frequencies s)
  (define frequencies (make-hash))
     (for ([c (string->list s)])
           (hash-update! frequencies c add1 0))
  frequencies)


(define frequencies (char-frequencies "abcdeaxa"))

(hash-ref frequencies #\a)

;; FINAL-ALERT - Think about how to write the function all-anagrams without the sort function. 





;a -> 2
;b -> 1
;c -> 1



;; Problem 6
;; Write a function called max-of-ints, that takes a list of numbers and returns their max.
(define (max-of-ints numbers) ;; numbers is a list
  (define candidate-max -inf.0)
  (for ([k numbers])
    (if (> k candidate-max)
        (set! candidate-max k)
        (void)))
    
  candidate-max)

  (max-of-ints (list 1 44 2 3 5))
  ;; Problem 7
;; Create a function called max-frequency that takes a string, and returns the max frequency of any character











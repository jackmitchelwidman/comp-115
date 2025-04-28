#lang racket

;; PROBLEM SET 9 - Due Sunday, May 4, at 11 PM

;; Note - Where applicable, test your solutions with a couple example inputs.

;; Problem 1
;; Create a hash table called string-lengths, with three key-value pairs.
;; They are
;; "be" -> 2
;; "alert"     -> 5
;; "democracy" -> 9;;
;; Remember - The way we make the pair "house" -> 5 is:  (cons "house" 5)
;; Once you have the hash table string-lengths, call functions to get:
;; i) The size of the hash table. (We haven't seen this function yet. It is hash-count)
;; ii) The list of keys
;; iii) The list of values



;; Problem 2 
;; Take the hash table string-lengths from problem 1 and modify it so that the key "democracy"
;; gets mapped to 10, instead of 9.




;; Problem 3 
;; Consider the following struct
(define-struct person [name age])
;; Write a function called person-to-map, that takes a list of people, (person objects), and
;; returns a hash table that maps their names to their ages.

;; REMARK - To test this, you will need to create a list of some person objects and then call person-to-map on it. 



;; Problem 4  
;; Write a function called get-values-in-uppercase, that takes a map whose values are strings,and returns a list
;; of those values in uppercase. Remember the function to make a string uppercase is string-upcase

;; REMARK - To test this, you will need a map whose values are strings. This could be a map of ids to names, or
;;          a map of numbers to words whose length is that number, or any map you can think of, whose values
;;          are strings. Then call get-values-in-uppercase on that map. 



;; Problem 5
;; Write a function called same-characters, that takes two strings and returns true if they have the same characters,
;; and false otherwise.
;; Examples - (same-characters "ear" "area") -> #t
;;            (same-characters "cat" "car") -> #f
;; Some guiding ideas:
;; i) Use hash maps. If you put each character from a string in a hash map,
;;    then the list of keys will have every character and each only once.
;; ii) We don't care about the values in this case. That can be anything. You can use,
;;     for example, the key itself or just map every character to the number 1. It doesn't matter.
;; ii) If two strings have the same characters, the two hash tables you create will be the same. 


    
;; Problem 6
;;
;; Write a function called remove-duplicates that takes a string and returns a string with duplicate characters removed.
;; Its ok if the resulting string has a different order. 
;; "aba" -> "ab"  ("aba" can also go to "ba"). 
;; "express" -> "exprs"  (here too, and the next one, the order of the characters doesn't matter)
;; "alliteration" ->"aliteron"

;; Guiding ideas
;; i) Remember, in hash table, the keys are ALWAYS unique. Use this fact.
;; ii) As in Problem 5, the values don't matter here. 
;; ii) When you are done creating your hash table,
;;     you can get the keys, which will be a list of characters,
;;     and turn it back into a string. 



;; Problem 7
;; Use the function remove-duplicates, from problem 6, to write a function
;; called has-no-duplicates?, which takes a string and returns #t
;; if it has no duplicate characters and false otherwise.
;; Hint: Hash tables do not have any particular order. This means
;; if you convert a string to a list of characters, and create a hash map
;; out of it, and then eventually turn it back into a string, the order of the characters
;; in the string may have changed. So if you are comparing two strings, which you
;; created in this way, if you want to be sure the two strings are
;; the same, you can sort them first, and then compare them. To make this easier
;; first write a function called sort-string, which sorts a string. (puts it in alphabetical order)
;; Then use the sort-string function in your has-no-duplicates? function.


    
    
#lang racket


;; PROBLEM SET 8 - DUE WEDNESDAY, April 23rd, at 10:00 PM. 

;; Problem 1.
;; Load the words file into a list called 'word-list' in Racket, as we did in class. Find the length,
;; and make sure it is 10,000


;; Problem 2
;; Write a function called 'sort-string' that takes a string and sorts it.

;; Problem 3
;; Write a function called 'sort-sring-list' which takes a list of strings and sorts them.

;; Problem 4
;; Write a function called 'find-word', which takes a word and a list of words, and returns
;; a list of the one word, if it is in the list, and the empty list, otherwise.
;; HINT - If the word is in the list, it is equal to one of the elements in the list. And remeber to use string=?


;; Problem 5
;; This problem introduces a new kind of collection, which is a little different from list. It is called set.
;; A set is like a list except that in a set an element can only occur once, and there is no particular order
;; to the elements. We write the set that contains 1, 2 and 3 as (set 1 2 3). From what it says above, notice
;; that the sets (set 1 2 3) and (set 1 2 3 1) are the same sets. The '1' is only counted once, even if you include
;; it more than once. To find out how many element are in a set, we use the function 'set-count'
;; Notice that (set-count (set 1 2 3)) = 3 = (set-count (set 1 2 3 1))
;; There is also a useful function called 'list->set' which converts a list into a set.
;;
;; For this problem, write a function called 'distinct', which takes a list and tells you if all
;; the elements in the list are distinct. HINT - use a set.


;; Problem 6
;; Write a function called 'apply-function', which takes two arguments:
;; i) a function that takes a number and returns a number (like sqr)
;; ii)a number
;; And the function applies the function to the number and returns the result.
;; For example, (apply-function sqr 3) should return 9


;; Problem 7
;; When you have two lists, list-1 and list-2, and you want a new list of pairs where the pairs are made up of an
;; element from list-1 and one from list-2. For example, if I have '(1 2 3) and '("a" "b" "c"), then I want to create
;; the list '((1 "a") (2 "b") (3 "c")). We are assuming the lists are the same size. To achieve this, we can do:
;; this - (map list list-1 list2).
;; Using this approach, take as the first list, word-list, and as the second list - word-list sorted by length of words,
;; and determine if, by chance, any of the words are in the same position in the new list. When sorting a list of words,
;; use 'string<?' as opposed to 'char<?' which is used when sorting a word. (i.e. alphabetizing)
;; Hint - First define the list of pairs of words and then filter over it with an appropriate lambda function. 
; I will explain this. 

 ;; Extra Credit *
 ;; Find a way to tell if two words are anagrams without sorting them. It should be more efficient than sorting. You can tell if one function
;; is more efficient by running the two functions with a large input. For example, 10,000 words. If both functions give their result immediately, try this on a bigger list, say
;; 100,000 words. You can find long lists of words on Google.  There is also a website called Kaggle, ( https://www.kaggle.com/ ). It is all about data science and everything data.
;; On the left side of the homepage, there is a link called 'Datasets'. You can find all sorts of interesting and useful data here. 

#lang racket

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lab Problem 1
;; There is a new file in the data folder in github. It is also called words. I replaced the old one with his
;; list which is cleaner. It is the 10,000 most common English words, according to one source.
;; Load the file into a list called 'word-list'. Make sure to remove duplicates and make all the words lower-case. The
;; remove duplicates function is called 'remove-duplicates' and the make lower case function is called 'string-downcase'. 
(define word-list (file->lines "/Users/jackwidman/words"))
;;Modify The above line to do two things - i) remove duplicates and ii)make every word lower case


;;Lab Problem 2
;; Print the length of the list 'word-list'.
;(length word-list)  ;;  Check that this is 10,000

;; Lab Problem 3
;; Print a list of the lengths of the words in word-list

;; Lab Problem 4
;; Print a list of all the words in word-list but in upper case. The function is called 'string-upcase'.

;; Lab Problem 5
;; Create and print a list called 3-letter-words which consists of all the words in word-list which have 3 letters.

;; Lab Problem 6
;; Recall the defintion of are-anagrams?
(define (are-anagrams? word1 word2)
  (and
   (= (string-length word1) (string-length word2))
   (equal?
    (sort (string->list word1) char<?) (sort (string->list word2) char<?))))

;; Use this function to create a function called 'anagrams-of' which takes a word and returns a list of all the words in
;; word-list that are anagrams of it. Note - This will include the word itself, which is ok. 

(define (anagrams-of word)
  (filter (lambda (w) (are-anagrams? w word))  word-list))


;(anagrams-of "enemy")

;(anagrams-of "latitude")

;; Lab Problem 7
;; Use the function from Problem 6, called 'anagrams-of', to create a list of lists. The inner lists will be the anagrams of
;; a given word. So it will be a list of lists, each list of which is a list of a word and its anagrams.
;; Hint - try mapping the appropriate function over every word in 'word-list'
;; NOTE: If you do this correctly, when you run it, it will take some time to run. (Probably less than 10 seconds. In DrRacket,
;; on the bottom right, you will see an animation of a little person running. This means the program is running and hasn't completed yet. 

(define anagrams (map anagrams-of word-list))

(filter (lambda (lst) (> (length lst) 1)) anagrams)




;; Lab Problem 7.5
;; Take the list that comes from problem 7 and filter it to get only those lists that have more than one element.
;; The lambda should take a list and return true if its length is > 1 and false otherwise. 

;; Lab Problem 8
;; Create and print a list called  'words-by-length', which consists of all the words in 'word-list' ordered by word length. 
;; If two words have the same length, any order is fine. Hint- for the order function, use a lambda


;; Lab Problem 9 - tricky
;; When you have two lists, list-1 and list-2, and you want a new list of pairs where the first pair is the pair of first
;; elements of list-1 and list-2, and the second pair is the pair of second elements of list-1 and list-2 etc, you can do
;; this - (map list list-1 list2).
;; Using this approach, take as the first list, word-list, and as the second list - word-list sorted by length of words,
;; and determine if, by chance, any of the words are in the same position in the new list. When sorting a list of words,
;; use 'string<?' as opposed to 'char<?' which is used when sorting a word. (i.e. alphabetizing)
;; Hint - First define the list of pairs of words and then filter over it with an appropriate lambda function. 
; I will explain this. 

 ;; Extra Credit *
 ;;  Do Problem 6 without sorting. In other words, find a way to tell if two words are anagrams without sorting them. It should be more efficient than sorting. You can tell if one function
;; is more efficient by running the two functions with a large input. For example, 10,000 words. If both functions give their result immediately, try this on a bigger list, say
;; 100,000 words. You can find long lists of words on Google.  There is also a website called Kaggle, ( https://www.kaggle.com/ ). It is all about data science and everything data.
;; On the left side of the homepage, there is a link called 'Datasets'. You can find all sorts of interesting and useful data here. 


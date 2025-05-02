;; COMP 115 FINAL EXAM STUDY SHEET
;;          (I will add more problems to this list over the next few days -jw)
;;          (I will also give you further notes that flesh out each topic - jw)

#lang racket

;;Topics you need to know.

;; 1) How to create a variable.
;;    Problem - Create a variable called width and set it to 300.
;;    Solution
      (define width 300)
;;    Test
      (displayln "Setting width to 300")
      width

;; 2) How to change the value of a variable.
;;    Problem - Change the value of width to 320.
;;    Solution
      (set! width 320)
;;     Test
       (displayln "Changing width to 320")
       width

;; 3)  How to create a function (basic form)
;;     Problem - Create a function called plus-one, that takes a number and adds one to it.
;;               I know there exists a function called add1, that does this, but pretend it doesn't exist.
;;     Solution
       (define (plus-one n)
         (+ n 1))
;;     Test
       (displayln "Adding 1 to 3")
       (plus-one 3)

;; 4)  How to create a function (lambda form)
;;     Problem - Create a function called plus-one-lambda, that takes a number and adds one to it.
;;               Use lambda.
;;     Solution
       (define plus-one-lambda (lambda (n) (+ n 1)))
;;     Test
       (displayln "Adding 1 to 3 (lambda form)")
       (plus-one-lambda 3)

;;  5) How to create a function with two arguments (basic form)
;;     Problem - Create a function called add-two-numbers, that takes two numbers and returns their sum.
;;     Solution
       (define (add-two-numbers m n)
         (+ m n))
;;     Test
       (displayln "Adding 3 and 5")
       (add-two-numbers 3 5)

;;   6) How to create a function with two arguments (lambda form)
;;      Problem - Create a function called add-two-numbers-lambda, that takes two numbers and returns their sum.
;;      Use lambda
;;      Solution
        (define add-two-numbers-lambda (lambda (m n) (+ m n)))
;;      Test
        (displayln "Adding 3 and 7 (lambda form)")
        (add-two-numbers-lambda 3 7)

;;    7) How to create a list of n numbers for any number n.
;;       Problem - Define a variable called numbers, and initialize it to the list of numbers from one to one hundred.
;;       Solution
         (define numbers (build-list 100 add1))
;;       Test
         (displayln "Creating a list of numbers fromn 1 to 100")
         numbers

;;     8) How to map a function over a list.
;;        Problem - Map the function sqr over the list numbers, you created in problem 7.
;;        Solution
          (displayln "Squaring all the numbers in the list 'numbers'")
          (map sqr numbers)
;;        Remark - With an expression like this, we don't need a separate test since this expression
;;                  will display the answer automatically when we run it. Its different with functions
;;                  since they have to be called, in order to see the output. So from here on, with
;;                  expressions that are not functions, we don't need a separate test. 

;;     9) How to map a function over a list with a lambda function.
;;        Problem - Pretend sqr didn't exist, and do what problem 8 does but with a lambda function.
;;        Solution
          (displayln "Squaring all the numbers in the list 'numbers' with a lambda function")
          (map (lambda (n) (* n n)) numbers)

;;      10) How to filter a predicate over a list. (Basic form). (Remember that a predicate is a function that returns a boolean).
;;          Problem - First create a function called less-than-10?, and then filter the list numbers,
;;                    from above, by the predicate less-than-10?
;;          Solution
            (define (less-than-10? n)
              (< n 10))

            (displayln "Filtering 'numbers' to get the ones less than 10")
            (filter less-than-10? numbers)

;;      10) How to filter a predicate over a list. (lambda form). (Remember that a predicate is a function that returns a boolean).
;;          Problem - Filter the list numbers by a lambda function that tests if a number is less than 10.
;;                    
;;          Solution
            (displayln "Filtering 'numbers' to get the ones less than 10 with a lambda function.")
            (filter (lambda (n) (< n 10)) numbers)


;;       11) How to map a function over a list of strings. 
;;           Problem - Create a function called strings-to-uppercase that takes a list of strings and returns a list of
;;                     those strings in uppercase.
;;           Solution
             (define (strings-to-uppercase strings)
               (map string-upcase strings))
;;           Test
             (displayln "Making all the strings in a list uppercase.")
             (strings-to-uppercase (list "once" "upon" "a" "time"))

;;       12) How to filter a predicate over a list of strings.
;;           Problem - Create a function called short-strings that takes a list of strings and returns
;;                     a list of those strings whose length is less than 5
;;           Solution
             (define (short-strings strings)
               (filter (lambda (s) (< (string-length s) 5)) strings))
;;           Test
             (displayln "Filtering a list of strings to get the ones with length < 5")
             (short-strings (list "Wesleyan" "Harvard" "Yale" "Princeton"))

;;       13) How to create a struct.
;;           Problem - Create a struct called book with fields id title author and year-published. Then create
;;                     a book object. The data doesn't have to reflect an actual book. 
;;           Solution
             (define-struct book [id title author year-published]) ;; year-published is a number
             (define my-favorite-book (make-book 1 "Jude the obscure" "Thomas Hardy" 1895))
;;           Test
             (displayln "Getting the title of a book object.")
             (book-title my-favorite-book)

;;       14) How to map a function over a list of struct instances.
;;           Problem - Using the book struct, create a function called get-titles, that takes
;;                     a list of books, and returns a list of their titles.
;;           Solution
             (define (get-titles books)
               (map book-title books))
;;           Test
             (displayln "Getting all the titles of a list of books")
             (get-titles (list (make-book 2 "Some made up book" "Ignatious Higgins" 1973) (make-book 3 "I-Me" "Thoralf Sanders" 1923)))


;;        15) How to create a (mutable) hash map.
;;            Problem - Create a hash map called word-lengths and initialize it with three words and their lengths.
;;            Solution
              (define word-lengths (make-hash (list (cons "hello" 5) (cons "goodbye" 7) (cons "antidisestablishmentarianism" 28))))
;;            Irrelevant Remark - This word is the 6th longest word in the Oxford English Dictionary.
;;            Test
              (displayln "Getting the lengths of strings from a hash table.")
              word-lengths

;;         16) How to load a file. 
;;             Problem - Load the file words or words.txt (depending on what you called it when you downloaded it) into a
;;                       variable called word-list. It should be a list of words.
;;             Solution
               (define word-list (file->lines "/home/jackwidman/work/comp-115/data/words")) ;; REPLACE this path with your path to the file. 
;;             Test
               (displayln "Getting the first 10 words from the list we just loaded.")
               (take word-list 10) ;; I don't want to print out all 10000 so i'm just showing 10.


;;         17) How to use a for loop with a list of strings.
;;             Problem - Use a for loop to loop through all the words in word-list and print them.
;;                       You can use the function displayln to print them.
;;             Solution
               (displayln "Printing all the words in a list.")
               (for ([word word-list])
                 (displayln word))

 
;;         18) How to use a for loop with a list of structs.
;;             Problem - Here is a struct called number with the fields value and is-prime?.
               (define-struct number [value is-prime?])
;;                       And here is a list of 100 number objects.    
               (define a-hundred-numbers
                  (list  (make-number 13 #t)   (make-number 51 #f)   (make-number 23 #t)   (make-number 44 #f)   (make-number 37 #t)
                         (make-number 18 #f)   (make-number 67 #t)   (make-number 82 #f)   (make-number 29 #t)   (make-number 48 #f)
                         (make-number 53 #t)   (make-number 94 #f)   (make-number 11 #t)   (make-number 75 #f)   (make-number 31 #t)
                         (make-number 26 #f)   (make-number 59 #t)   (make-number 98 #f)   (make-number 17 #t)   (make-number 64 #f)
                         (make-number 79 #t)   (make-number 38 #f)   (make-number 71 #t)   (make-number 52 #f)   (make-number 43 #t)
                         (make-number 24 #f)   (make-number 89 #t)   (make-number 46 #f)   (make-number 19 #t)   (make-number 68 #f)
                         (make-number 97 #t)    (make-number 36 #f)   (make-number 61 #t)   (make-number 84 #f)   (make-number 13 #t)
                         (make-number 50 #f)   (make-number 73 #t)   (make-number 96 #f)   (make-number 29 #t)   (make-number 42 #f)
                         (make-number 53 #t)   (make-number 86 #f)   (make-number 23 #t)   (make-number 58 #f)   (make-number 37 #t)
                         (make-number 20 #f)   (make-number 67 #t)   (make-number 90 #f)   (make-number 17 #t)   (make-number 62                                                            #f)
                         (make-number 79 #t)   (make-number 34 #f)   (make-number 71 #t)   (make-number 56 #f)   (make-number 43 #t)
                         (make-number 40 #f)   (make-number 61 #t)   (make-number 88 #f)   (make-number 13 #t)
                         (make-number 54 #f)   (make-number 73 #t)   (make-number 92 #f)   (make-number 29 #t)   (make-number 44 #f)
                         (make-number 53 #t)   (make-number 80 #f)   (make-number 23 #t)   (make-number 60 #f)   (make-number 37 #t)
                         (make-number 40 #f)   (make-number 61 #t)   (make-number 88 #f)   (make-number 13 #t)
                         (make-number 22 #f)   (make-number 67 #t)   (make-number 94 #f)   (make-number 17 #t)   (make-number 66 #f)
                         (make-number 79 #t)  (make-number 30 #f)   (make-number 71 #t)   (make-number 52 #f)   (make-number 43 #t)
                         (make-number 26 #f)   (make-number 59 #t)   (make-number 98 #f)   (make-number 11 #t)   (make-number 74 #f)
                         (make-number 89 #t)   (make-number 42 #f)   (make-number 31 #t)   (make-number 76 #f)   (make-number 53 #t)
                         (make-number 20 #f)   (make-number 67 #t)   (make-number 90 #f)   (make-number 19 #t)   (make-number 58 #f)
                         (make-number 97 #t)   (make-number 32 #f)   (make-number 61 #t)   (make-number 84 #f)   (make-number 29 #t)
                         (make-number 46 #f)   (make-number 73 #t)   (make-number 96 #f)   (make-number 13 #t)   (make-number 50 #f)
                         (make-number 79 #t)   (make-number 38 #f)   (make-number 71 #t)   (make-number 54 #f)   (make-number 37 #t)
                
                         ))

;;             Now filter this list by the predicate is-prime? to get those numbers that are prime. 

;;             Solution
               (displayln "Filtering a list of number objects to get just the primes")
               (map number-value (filter (lambda(n) (equal? (number-is-prime? n) #t)) a-hundred-numbers))
                         

;;         19) How to create a frequency map for a string. A frequency map is a hash map that maps each character in
;;             a string, to its frequency, i.e. the number of times it occurs in the string.
;;             For example, the frequency map for "door" could be written:
               (make-hash (list (cons #\d 1) (cons #\o 2) (cons #\r 1)))  ;; Notice how we express a character in Racket.
;;             Problem - Write a function called create-frequency-map, that takes a string and returns its frequency map.
;;                       Simplifying assumption: You may assume all strings are lowercase. 
;;             Solution
               (define (create-frequency-map s)
                 (define character-list (string->list s))
                 (define frequency-map (make-hash))
                 (for ([c character-list])
                   (hash-update! frequency-map c add1 0))
                 frequency-map)
;;             Test
               (displayln "Creating the frequency map for 'alabama'")
               (create-frequency-map "alabama")
               (displayln "Creating the frequency map for ''")
               (create-frequency-map "")

;;          20) How to use a frequency map to determine if two words are anagrams.
;;              Problem - Write a function called are-anagrams, that takes two words
;;                        and returns #t if they are anagrams and #f otherwise. Use
;;                        the function create-frequency-map from problem 19.
;;              Solution
                (define (are-anagrams? word1 word2)
                  (equal? (create-frequency-map word1) (create-frequency-map word2)))
;;              Test
                (displayln "Determining if 'yemen' and 'enemy' are anagrams.")
                (are-anagrams? "yemen" "enemy")
                (displayln "Determining if 'car' and 'cart' are anagrams")
                (are-anagrams? "car" "cart")
;;


;;         21) How to find all anagram groups in a list of strings. An anagram group is a list of words, which are anagrams of each other.
;;             Problem - Write a function called anagram-groups, that takes a list of strings and returns a list of all anagram groups.
;;             Guiding Principles
;;             i) If we sort the words in an anagram group, we will get the same string for all of them.
;;             ii) We can use this idea if we make the sorted value of each word the key in a hash table.
;;             ii) The hash table we are creating for this problem, maps for a given word from the list,
;;                 the sorted value to the list of all words that are anagrams of the given word.
;;             You will need hash-update! here. Remember to include the default value, which is '()
;;             Solution
                
;;             Solution
               (define (anagram-groups words) ;; words is a list of strings
                 (define anagram-hash (make-hash))
                 (for ([word words])
                   (define sorted-word (sort (string->list word) char<?))
                   (hash-update! anagram-hash sorted-word (lambda (word-list) (cons word word-list)) '()))
                 (filter (lambda (lst) (> (length lst) 1))  (hash-values anagram-hash) ))
;;               Test
                 (displayln "Finding all anagram groups for the list '(abc cab x enemy yemen)")
                 (anagram-groups (list "abc" "cab" "x" "enemy" "yemen"))
                 (displayln "Finding all anagram groups for the list word-list of 10,000 words")
                 (anagram-groups word-list)
                   
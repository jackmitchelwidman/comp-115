#lang racket

;; COMP-115 (section 2) FINAL EXAM

;; For every problem, please test your answer and precede the test with the word 'Test' and also print some text that describes which problem it is.
;; For example

;; WHEN YOU ARE DONE - email your exam, while still in the room, to jack.widman@gmail.com

;; SAMPLE PROBLEM - Write a function that squares a number.
(define (square n)
  (* n n))
;; Test
(displayln "The square of 3 is")
(square 3)

;; Problem 1 - Create a list called numbers, which contains the numbers 1 to 100.

;; Problem 2 - Write a function called square-plus-two, which takes a number n, squares it and adds 2. 
;;             It can either be a regular function or a lambda function. 

;; Problem 3 - map the function from problem 2 over the list numbers from problem 1.


;; Problem 4 - Create the list of the odd numbers from 1 to 1000.
;; Hint: You can use the following function:
(define (is-odd? n)
  (= (modulo n 2) 1))

;; Problem 5 - Write a function called is-upper-case? that takes a string and returns #t if its upper case and false if it's not.
;;             REMARK - By 'upper case', I mean that every character is upper case.


;; Problem 6 - Define a variable called multiply and assign to it a lambda function that takes two numbers and multiplies them together.

;; Problem 7 - Load the contents of the file words (or you may have it called words.txt) into a list called word-list.

;; Problem 8 - Write a function called starts-with-a? that takes a word (a string) and returns #t if it starts with an a or an A and #f otherwise.
;;             Remember that in Racket, the letter a is expressed as #\a
;;             Once you have starts-with-a?, find all the words in the word-list from problem 7 that start with an a or an A. 
;;             

;; Problem 9 - Create a struct called account with the fields name and balance.
;;             Then create a list called three-accounts that contains three accounts.
;;             What built-in functions come with this struct for free? You should be able to name 5 such functions.


;; Problem 10 - Write a function called add-accounts that takes two accounts and returns a third account in the following way:
;;              The name of the new account is the name of the first account plus a "-" plus the name of the second account.
;;              For example, if the name of the first account is "truly" and the name of the second account is "marvelous", then the name of
;               the new account is "truly-marvelous".
;;              The amount of the new account is the sum of the amounts of the two accounts.
;;              To test this, call add-accounts on two accounts and set the variable new-account to the result of add-accounts. Then show the name and
;;              the balance of new-account. 

;; Problem 11 - Now we have a way to combine two accounts. Write a recursive function called add-list-of-accounts that takes a list of
;;             accounts and combines them all together with add-accounts.
;;              Hint - You know how to write a function that adds and multiplies a list of numbers and also one that ands and ors together a list of
;;              booleans and one that concatenates a list of strings. Do something similar.
;;              To test this function, call it on the list called three-acounts, that you created in problem 9.


;; Problem 12  - Write a function called repeated-digits that takes a number and returns #t if it has at least one repeated digit and #f otherwise.
;;               The repeated digits do not have to be consecutive.
;;               You may use the built-in function number->string that converts a number into a string.


;; Problem 13 - Write a function called divides? which takes two numbers a and b and returns #t if a divides b and #f otherwise.
;;              So, for example, (divides? 3 9) should return #t but (3 10) should return #f.
;;              Hint - use the modulo function and remember that when using the modulo function, the bigger number comes first. 


;; Problem 14 - Use the divides? function from problem 13 to write a function called factors-of, which takes a number n and returns its positive factors.

;; Problem 15 - Use the function factors-of, from problem 14, to write a function is-prime? that takes a number and returns #t if it is prime and #f otherwise.

;; Problem 16 - Use the is-prime? function to display all the prime numbers between 1 and 10,000


;; Problem 17 - A number is called perfect, if the sum of its positive factors is equal to two times the number.
;;              So for example, 6 is perfect, since the factors of 6 are 1, 2, 3 and 6, and their sum is 12, which is 2 times 6.
;;              Write a function called is-perfect? that takes a number and returns #t if its perfect and #f otherwise. 
;               Then write a function called perfect-numbers, that takes a number n, and returns a list of all perfect numbers less
;;              than or equal to n. Now use that function to list all perfect numbers less than or equal to 10,000.  It may take a few seconds to
;;              give you the answer.
;;              (Interesting Fact - Nobody knows if there are any odd perfect numbers!) 

;; Problem 18 - Create a hash table whose keys are the numbers 1 to 10,000 and for a given key n, the value is the list of factors of n. You can,
;;              of course, use factors-of from problem 14 to get the list of factors for each number.

;; Problem 19 - Find all palindromes in the file words.txt. Remember a palindrome is a word that is the same forwards and backwards. 

;; Problem 20 Create a variable called width and set it to 300. You're welcome. 


;; Extra Credits

;; Extra Credit 1 - Find all numbers between 1 and 10,000 that have the maximum number of factors of any number in this range.

;; Extra Credit 2  - A pair of numbers is called a 'twin prime pair', if they are both prime and they differ by 2. So, for example,
;;                   (3, 5) is a twin prime pair and so is (17, 19). But (7, 9) is not, since 9 is not prime.
;;                   Find all twin prime pairs between 1 and 1000

;; Extra Credit 3 - Use recursion to write a function multiply, that takes two numbers, m and n, and multiplies them together.
;;                  DO NOT use the * symbol. Use only the + symbol. Remember, multiplication is repeated addition.
;;                  Hint: In the recursion, use the fact that (multiply n 1) is always n. 

;; Extra Credit 4 - Find a number between 1 and 10,000 that has exactly 27 factors.



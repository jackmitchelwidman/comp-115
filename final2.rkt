#lang racket

;; COMP-115 (section 1) FINAL EXAM

;; IMPORTANT! WHEN YOU ARE DONE - email your exam, while still in the room, to jack.widman@gmail.com

;; REMARK - This final is meant to give you a feel for what it is really like to solve problems as a programmer. Do your best and
;;          if you are unable to give a correct, running solution for a problem, make sure you write down whatever you understand about it. I want
;;          to see evidence of thinking. There will be partial credit and this exam will be graded on a curve.
;;          Though I cannot predict the future, I expect the distribution of grades to be in the B- to A+ range. 


;; IMPORTANT! For every problem, please test your answer and precede the test with the word 'Test' and also print some text that describes which problem it is.
;; For example

;; SAMPLE PROBLEM - Write a function that squares a number.
(define (square n)
  (* n n))
;; Test
(displayln "The square of 3 is")
(square 3)

;; Problem 1 - Create a list called numbers, which contains the numbers 1 to 100.

;; Problem 2 - Write a function called square-times-five, which takes a number n, squares it and multiplies it by 5. 
;;             It can either be a regular function or a lambda function.

;; Problem 3 - map the function from problem 2 over the list numbers from problem 1.



;; Problem 4 - Create the list of the even numbers from 1 to 100.
;; Hint: You can use the following function:
(define (is-even? n)
  (= (modulo n 2) 0))



;; Problem 5 - Write a function called is-lower-case? that takes a string and returns #t if its lower case and false if it's not.
;;             REMARK - By lower case', I mean that every character is lower case.


;; Problem 6 - Define a variable called multiply and assign to it a lambda function that takes two numbers and multiplies them together.


;; Problem 7 - Load the contents of the file words (or you may have it called words.txt) into a list called word-list.


;; Problem 8 - Write a function called starts-with-ab? that takes a word (a string) and returns #t if it starts with ab, AB, aB or Ab and #f otherwise.
;;             Remember that in Racket, the letter a is expressed as #\a
;;             Once you have starts-with-ab?, find all the words in the word-list from problem 7 that start with ab in any of the four cases.
                             

;; Problem 9 - Create a struct called account with the fields name and balance.
;;             Then create a list called three-accounts that contains three accounts.
;;             What built-in functions come with this struct for free? You should be able to name 5 such functions.



;; Problem 10 - Write a function called add-accounts that takes two accounts and returns a third account in the following way:
;;              The name of the new account is the name of the first account plus a ":" plus the name of the second account.
;;              For example, if the name of the first account is "ultra" and the name of the second account is "fantastic", then the name of
;               the new account is "ultra:fantastic".
;;              The amount of the new account is the sum of the amounts of the two accounts.
;;              To test this, call add-accounts on two accounts and set the variable new-account to the result of add-accounts. Then show the name and
;;              the balance of new-account.
;;              You will need the string-append function that takes some strings and appends them together.
;;              e.g. (string-append "Who" " "  "me?") will return "Who me?"





;; Problem 11 - Now we have a way to combine two accounts. Write a recursive function called add-list-of-accounts that takes a list of
;;             accounts and combines them all together with add-accounts.
;;              Hint - You know how to write a function that adds and multiplies a list of numbers and also one that ands and ors together a list of
;;              booleans and one that concatenates a list of strings. Do something similar. But remember, in this case, in addition to checking
;;              if the list is empty, you will also have to handle the case where the list of accounts contains just one account. 
;;              To test this function, call it on the list called three-acounts, that you created in problem 9.


;; Problem 12  - Write a function called repeated-digits? that takes a number and returns #t if it has at least one repeated digit and #f otherwise.
;;               The repeated digits do not have to be consecutive.
;;               You may use the built-in function number->string that converts a number into a string.


;; Problem 13 - Write a function called divides? which takes two numbers a and b and returns #t if a divides b and #f otherwise.
;;              So, for example, (divides? 3 9) should return #t but (3 10) should return #f.
;;              Hint - use the modulo function and remember that when using the modulo function, the bigger number comes first. 

;; Problem 14 - Use the divides? function from problem 13 to write a function called factors-of, which takes a number n and returns its positive factors.


;; NOTE - I said on the study sheet that if I ask you to write the is-prime? function, it would be extra credit. But I decided to give hints and make it
;;        a regular problem. So here it is:
;; Problem 15 Use the function factors-of, from problem 14, to write a function is-prime? that takes a number and returns;
;;           #t if it is prime and #f otherwise. If you are unsure how to do this, think about what factors-of gives you,
;;           and how to tell if a number is prime by looking at the list returned from factors-of. 



;; Problem 16 - Use the is-prime? function to display all the prime numbers between 1 and 10,000



;; Problem 17 - A pair of numbers like (3, 5) are called a 'twin prime pair' if they are both prime and they differ by 2.
;;              So the first 3 twin prime pairs are (3, 5) (5, 7) and (11, 13). Notice that (7, 9) is not a twin prime pair because
;;              9 is not a prime. Write a function is-twin-prime-pair? that takes a pair of numbers and returns #t if they are a twin
;;              prime pair and #f otherwise.


;; Problem 18 - Use your is-twin-prime-pair? function to create a list of all the twin prime pairs under 10,000

;; HINT (in 3 steps) - If you want to filter, the list you need to filter needs to be pairs. One way to do this is to first take
;;        all primes, less than 10,000, then map this list of primes to a list of pairs (p, p+2) for all p and then
;;        filter by is-twin-prime-pair?
;; So
;; Step 1 - Use the answer from Problem 16, which is the list of all primes less than 10,000.

;; Step 2 - Map this list to pairs (p, p+2).  As a small example of this idea, consider
;(map (lambda (n) (list n (+ n 2))) (build-list 100 add1)) ;; would give the list of pairs (1,3), (2, 4), (3, 5), (4, 6) etc up to 100
;; So do something like this on the list of primes less than 10,000 and you will get all candidate twin prime pairs up to 10,000.

;; Step 3 - Do the appropriate filtering to just be left with the pairs which happen to be twin prime pairs.

;; REMARK - It is unknown whether there are infinitely many twin prime pairs.  The two primes in the currently largest known
;;          twin prime pair example have 388,342 digits! Soak that in, before advancing to Problem 19.
;;          Ok, have you soaked that in?  Then proceed. 



;; Problem 19 - Create a hash table whose keys are the numbers 1 to 10,000 and for a given key n, the value is the list of factors of n. You can,
;;              of course, use factors-of from problem 14 to get the list of factors for each number.


;; Problem 20 - Find all palindromes in the file words.txt. Remember a palindrome is a word that is the same forwards and backwards. 


;; Problem 21 Create a variable called width and set it to 300. You're welcome. 


;; Extra Credits


;; Extra Credit 1 - Use recursion to write a function multiply, that takes two numbers, m and n, and multiplies them together.
;;                  DO NOT use the * symbol. Use only the + symbol. Remember, multiplication is repeated addition.
;;                  Hint: In the recursion, use the fact that (multiply n 1) is always n. 

;; Extra Credit 2 - Find all numbers, if any,  between 1 and 10,000 that have exactly 64 factors. Print the numbers and print the list of their factors. 





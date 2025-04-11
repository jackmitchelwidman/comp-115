#lang racket


;;PROBLEM SET 7 - THIS PROBLEM SET IS DUE TUESDAY AT 8PM. There are 3 problems. 
;; The definitions are below. Under them, are the 3 problems.
;; For PROBLEM 3, you will need lambda, which we will cover in class Friday. 

;; Review of Databases
;; A database is container for data that is secure and allows the user to update and query the data.
;; A database contains a collections of tables. tables represent the 'objects' in our program. So
;; possible tables are 'students', 'classes', 'tests' etc.
;; So if you want to know something about students in a database, you can run a query that hits the
;; students table and get back a bunch of rows. Think of a table as a collection of rows, one for each
;; object, in this case, one for each student. 

;;Let's create a song database.
;;We need songs, artists and bands.  These will be the tables.
;; We will use a struct, for each object

;;First let's create a struct for table
(define-struct table [id name rows])
;;Here, rows is a list of objects, for example songs or bands or artists.

;;Now let's create a struct for the database
(define-struct database [id name tables])
;;Here, tables is a list of table objects.

;;Now let's define the objects, one for each table we will want. 

;; artist
(define-struct artist [id name nationality])

;; band
(define-struct band [id name year-founded artists]) ;;artists is a list of artist object

;; song
(define-struct song [id name band genre year])

;; Now for the data.
;; Let's start with some artists and bands.

;;Members of the Beatles
(define lennon (make-artist 1 "John Lennon" "British"))
(define mccartney (make-artist 2 "Paul McCartney" "British"))
(define harrison (make-artist 3 "George Harrison" "British"))
(define starr (make-artist 4 "Ringo Starr" "British"))

;;Members of the Rolling Stones
(define jagger (make-artist 1 "Mick Jagger" "British"))
(define richards (make-artist 2 "Keith Richards" "British"))
(define wood (make-artist 3 "Ronnie Wood" "British"))
(define watts (make-artist 4 "Charlie Watts" "British"))
(define wyman (make-artist 5 "Bill Wyman" "British"))

;; And now 2 bands
(define the-beatles
  (make-band 1 "The Beatles" 1960 (list lennon mccartney harrison starr)))
(define the-rolling-stones
  (make-band 2 "The Rolling Stones" 1962 (list jagger richards wood wyman)))
                                                    

;;And now for the tables
;; songs
(define songs-table (make-table 1 "songs" (list
                                     (make-song 1 "Yesterday" the-beatles "Pop" 1965)
                                     (make-song 2 "Hey Jude" the-beatles "Rock" 1968)
                                     (make-song 3 "Let It Be" the-beatles "Rock" 1970)
                                     (make-song  4 "Strawberry Fields Forever" the-beatles "Psychedelic Rock" 1967)
                                     (make-song 5 "Penny Lane" the-beatles "Pop" 1967)
                                     (make-song 6 "All You Need Is Love" the-beatles "Pop" 1967)
                                     (make-song 7 "Come Together" the-beatles "Rock" 1969)
                                     (make-song 8 "Something" the-beatles "Rock" 1969)
                                     (make-song 9 "Eleanor Rigby" the-beatles "Baroque Pop" 1966)
                                     (make-song 10 "Satisfaction" the-rolling-stones "Rock" 1965)
                                     (make-song 11 "Paint It Black" the-rolling-stones "Rock" 1966)
                                     (make-song 12 "Sympathy for the Devil" the-rolling-stones "Rock" 1968)
                                     (make-song 13 "Gimme Shelter" the-rolling-stones "Rock" 1969)
                                     (make-song 14 "Brown Sugar" the-rolling-stones "Rock" 1971)
                                     (make-song 15 "Wild Horses" the-rolling-stones "Rock" 1971)
                                     (make-song 16 "Angie" the-rolling-stones "Rock" 1973)
                                     (make-song 17 "Start Me Up" the-rolling-stones "Rock" 1981)
                                     (make-song 18 "Honky Tonk Women" the-rolling-stones "Rock" 1969)
                                     (make-song 19 "Jumpin' Jack Flash" the-rolling-stones "Rock" 1968))))

;; artists
(define artists-table (make-table 2 "artists" (list lennon mccartney harrison starr jagger richards wood wyman)))

;; bands
(define bands-table (make-table 3 "bands" (list the-beatles the-rolling-stones)))

;; Finally, lets create the database.
(define db (make-database 1 "Jupiter" (list songs-table artists-table bands-table)))



;; PROBLEM SET

;;PROBLEM 1
;; print out the name of the database. (use the db instance we created)
;; print out a list of the table names


;; PROBLEM 2
;; print a list of all the names of the songs from 1969
;; HINT - Create a function called song-is-from-1969? which returns a boolean and then use map and filter
;; To test, this should print 4 songs.

;; PROBLEM 3
;; Create a function called songs-by-band, that takes a band name, and returns a list
;; of all that band's songs. If the name is not found, then the function should return
;; an empty list. e.g '()
;; For this problem, use lambda
;; To test, (songs-by-band "The Beatles") should print out a list of songs.
















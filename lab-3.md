# Lab 3: Structures

**Important**: Whenever you write a function in this class, follow the design recipe.

## 1 Defining structures

This week we studied a new kind of data type and definition: structures. A structure packages several values into a single new value. Consider the following Vehicle structure, which contains three fields: company, model and year.

```racket
; A Vehicle is (make-vehicle String String Number)
(define-struct vehicle [company model year])
```

**Exercise 1.** Which line above is a data definition? Which line above is a structure definition? Which line above has the types of each field? Which line above has the names of each field? Don't get these backwards!

The data definition on the first line is a comment, so the Beginning Student language does not enforce the types of the fields. But the structure definition on the second line is not a comment, so the Beginning Student language does enforce the number of fields and what they are called.

**Exercise 2.** A book has a title, author and number of pages. Define a structure for a book.

**Exercise 3.** Here is a data definition for an enumeration of academic departments:

```racket
; A Department is one of:
; - "biology"
; - "business"
; - "computer science"
; - "English"
```

An instructor has a name, department and salary. Define a structure for an instructor. Does your data definition for an instructor refer to the data definition for a department? It should.

## 2 Examples of structures

With the data definition of a Vehicle in hand, we can define some examples of Vehicles:

```racket
(define brians-vehicle (make-vehicle "Toyota" "Prius" 2015))
(define marks-vehicle (make-vehicle "Tesla" "Model 3" 2017))
(define rachaels-vehicle (make-vehicle "Nissan" "LEAF" 2015))
```

In the Interactions Window, we can retrieve the examples of Vehicles that we defined:

```
> brians-vehicle

(make-vehicle "Toyota" "Prius" 2015)

> marks-vehicle

(make-vehicle "Tesla" "Model 3" 2017)

> rachaels-vehicle

(make-vehicle "Nissan" "LEAF" 2015)
```

**Exercise 4.** Is the following an example of a Vehicle? What happens when DrRacket runs this definition? Why?

```racket
(define kens-vehicle (make-vehicle "Bicycle" 1982))
```

**Exercise 5.** Is the following an example of a Vehicle? What happens when DrRacket runs this definition? Why?

```racket
(define elons-vehicle (make-vehicle 2018 "SpaceX" "Falcon-9 Heavy"))
```

**Exercise 6.** Define three examples of books.

**Exercise 7.** Define three examples of instructors.

## 3 Courtesy functions for structures

When DrRacket runs the structure definition for vehicle, it defines the following five courtesy functions.

```racket
; make-vehicle : String String Number -> Vehicle
; vehicle-company : Vehicle -> String
; vehicle-model : Vehicle -> String
; vehicle-year : Vehicle -> Number
; vehicle? : Anything -> Boolean
```

The first courtesy function, make-vehicle, is called a constructor. The second, third, and fourth courtesy functions are called selectors (or accessors). The last one, vehicle?, is called a predicate.

The constructor make-vehicle makes a new Vehicle, as we saw in the last section.

Each selector retrieves the data stored in a given field. There are as many selectors as there are fields.
```
> (vehicle-company rachaels-vehicle)
"Nissan"
> (vehicle-model rachaels-vehicle)
"LEAF"
> (vehicle-year rachaels-vehicle)
2015
```

The predicate vehicle? determines whether a value is in fact a Vehicle:
```
> (vehicle? brians-vehicle)
#true
> (vehicle? marks-vehicle)
#true
> (vehicle? "geology")
#false
```

**Exercise 8.** List the signatures for each of the courtesy functions for the book structure you have defined above.

**Exercise 9.** List the signatures for each of the courtesy functions for the instructor structure you have defined above.

## 4 Templates from structures

From the Vehicle data definition, we can define the following template for functions which process Vehicles.
```racket
; process-vehicle : Vehicle -> ...
(define (process-vehicle v)
  (... (vehicle-company v) ...
       (vehicle-model v) ...
       (vehicle-year v) ...))
```

The template simply (and usefully) unpacks the various data contained in the input structure.

**Exercise 10.** Does the template for processing Departments have a conditional? Does the template for processing Vehicles have a conditional? Why the difference?

**Exercise 11.** Write a template for processing a book.

**Exercise 12.** Write a template for processing an instructor. Because this template contains a Department, it should also contain an application of process-department.

**Exercise 13.** Point out where the data definition for an instructor refers to the data definition for a department. Point out where your template for processing an instructor refers to the template for processing a department in the corresponding place.

## 5 Functions on structures

Here are two functions which have been designed using the template process-vehicle:

```racket
; praise-vehicle : Vehicle -> String
; returns a sentence that praises the given vehicle
(define (praise-vehicle v)
  (string-append (vehicle-company v)
                 " "
                 (vehicle-model v)
                 ", a car you can trust."))
 
(check-expect (praise-vehicle brians-vehicle)
              "Toyota Prius, a car you can trust.")
 
 
; upgrade-vehicle : Vehicle -> Vehicle
; increments the vehicle year by three years
(define (upgrade-vehicle v)
  (make-vehicle (vehicle-company v)
                (vehicle-model v)
                (+ (vehicle-year v) 3)))
 
(check-expect (upgrade-vehicle brians-vehicle)
              (make-vehicle "Toyota" "Prius" 2018))
```

**Exercise 14.** Design a function `tome?` which takes a book and returns whether it has more than 300 pages.

**Exercise 15.** Design a function `equalize-salary` which takes an instructor and returns another instructor with their salary changed to the salary for their department. Use the salary function provided below:

```racket
; salary : Department -> Number
; returns the salary for each department.
(define (salary d)
  (cond [(string=? d "biology")          100000]
        [(string=? d "business")         110000]
        [(string=? d "computer science") 120000]
        [(string=? d "English")          130000]))
 
(check-expect (salary "biology")          100000)
(check-expect (salary "business")         110000)
(check-expect (salary "computer science") 120000)
(check-expect (salary "English")          130000)
```

## 6 Practice with structures

**Exercise 16.** A pet has a name, species and age. Define a structure for a pet.

**Exercise 17.** Define three examples of pets.

**Exercise 18.** Write a template for processing a pet.

**Exercise 19.** Design a function `birthday` which takes a pet and returns another pet with their age increased by one year.

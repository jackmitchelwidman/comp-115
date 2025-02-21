# Lab 3: Structures

**Important:** Whenever you write a function in this class, follow the design recipe. 

## 1. Defining Structures

This week we studied a new kind of data type and definition: **structures**. A structure packages several values into a single new value. Consider the following `Vehicle` structure, which contains three fields: `company`, `model`, and `year`.

```racket
; A Vehicle is (make-vehicle String String Number)
(define-struct vehicle [company model year])
```

### Exercise 1
- Which line above is a **data definition**?
- Which line above is a **structure definition**?
- Which line above has the **types** of each field?
- Which line above has the **names** of each field?

> **Note:** The data definition on the first line is a comment, so the **Beginning Student language** does not enforce the types of the fields. But the structure definition on the second line is not a comment, so the **Beginning Student language** does enforce the number of fields and what they are called.

### Exercise 2
A book has a **title**, **author**, and **number of pages**. Define a structure for a **book**.

### Exercise 3
Here is a data definition for an **enumeration of academic departments**:

```racket
; A Department is one of:
; - "biology"
; - "business"
; - "computer science"
; - "English"
```

An **instructor** has a **name**, **department**, and **salary**. Define a structure for an **instructor**. Does your data definition for an instructor refer to the data definition for a department? It should.

---

## 2. Examples of Structures

With the data definition of a `Vehicle` in hand, we can define some **examples of Vehicles**:

```racket
(define brians-vehicle (make-vehicle "Toyota" "Prius" 2015))
(define marks-vehicle (make-vehicle "Tesla" "Model 3" 2017))
(define rachaels-vehicle (make-vehicle "Nissan" "LEAF" 2015))
```

In the **Interactions Window**, we can retrieve the examples of Vehicles that we defined:

```racket
> brians-vehicle
(make-vehicle "Toyota" "Prius" 2015)

> marks-vehicle
(make-vehicle "Tesla" "Model 3" 2017)

> rachaels-vehicle
(make-vehicle "Nissan" "LEAF" 2015)


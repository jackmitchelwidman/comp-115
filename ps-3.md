# Problem Set 3: Functions and Objects

**Important:** Whenever you write a function in this class, follow the design recipe. You will be graded accordingly.

## 1. Structures

### Problem 1
Consider the following data and structure definitions:

```racket
; a Date is (make-date Number String Number)
; Examples:
;   (make-date 2021 "Sep" 30)
;   (make-date 0 "January" 1)
; Non-examples:
;   (make-date 2021 30 9)
;   "September 30, 2021"
(define-struct date [year month day])
```

List the five courtesy functions that come with this structure and what their signatures are.

### Problem 2
According to WesPortal, an address has a first address line, a second address line, a city, a state, and a zip code. For example, the Department of Mathematics and Computer Science has:

- First address line: `"265 Church Street"`
- Second address line: `"Science Tower 655"`
- City: `"Middletown"`
- State: `"CT"`
- Zip code: `"06459"`

We will store zip codes as **Strings** in order to preserve leading zeroes.

Create a structure definition and a data definition for an address. Call the structure `address` with fields `line1`, `line2`, `city`, `state`, and `zip`.

### Problem 3
Design a struct to represent and address. Decide what fields you want to include. Create 3 instances of the struct, using make-address.

### Problem 4
Design a function called `connecticut?` which, given an address, determines if it is in Connecticut. A Connecticut address has a zip code between `06000` and `06999`. The function `string->number` may be useful.

### Problem 5
Design a function called `format-address` which, given an address, produces a string that you might write on a letter to that address. 

Note that line breaks are optional. If you do want to include them, line breaks are encoded as `"\n"`. **DrRacket** does not display line breaks in strings as actual line breaks. To see line breaks displayed properly, try composing `format-address` with `text` in the Interactions Window.

### Problem 6
Design a function called `smaller-zip` which, given two addresses, produces the address with the smaller zip code. (It doesn’t matter which address is returned if their zip codes are equal.)

---

## 2. Key Events

Similar to `MouseEvent`, `KeyEvent` is an enumeration of all the possible keyboard events, represented as Strings, to which `big-bang` can respond. Each keyboard event is represented by a String: for example, the `KeyEvent "q"` stands for the `q` key being pressed.

`KeyEvent` is a very long enumeration, so when writing function templates that process `KeyEvents`, we typically use `cond` clauses to distinguish `KeyEvents` of interest and use `else` to handle the remaining `KeyEvents`.

### Problem 7
Design a function `draw` which takes a string as input and draws it as an image. The `text` function will be useful. Make sure to place the text on a larger background image, like you did with the date in **Problem Set 1: Painting in DrRacket**.

Next, copy the following key handler and `big-bang` call into your **Definitions Window** and click **Run**.

```racket
; key->string : String KeyEvent -> String
; ignores the input String and outputs the KeyEvent as a String
(define (key->string s ke) ke)
 
(check-expect (key->string "q" "w") "w")
(check-expect (key->string "q" "left") "left")
 
; a World is a String
(big-bang ""
  [to-draw draw]
  [on-key key->string])
```

Try typing various keys, including the arrow keys and the shift keys. Notice which keys are represented as strings with length one, and which ones aren’t. When you are finished, **comment out** the `big-bang` call (the last three lines above).

### Problem 8
`1String` is the enumeration of all of the possible strings of length one. Design a function `key->1string` which takes a `1String` and a `KeyEvent` and returns the `KeyEvent` as a `1String` if it has length one. If the `KeyEvent` doesn’t have length one, the input `1String` is returned instead. 

**Hint:** Your conditional should have two clauses, one of which is an `else` clause.

Try out `key->1string` by creating a `big-bang` animation with `key->1string` as the key handler and `draw`. Run the animation, play with it, and comment it out when you are done.

### Problem 9
Design a function `lengthen` which takes a `String` and a `KeyEvent` and uses the `KeyEvent` to somehow lengthen the input `String`.

Try out `lengthen` by creating a `big-bang` animation with `lengthen` as the key handler and `draw`. Run the animation, play with it, and comment it out when you are done.

### Problem 10
Design a function `lengthen-with-reset` which behaves like `lengthen` but with the exception that pressing the space bar causes the current string to become empty (i.e., `""`). The `KeyEvent` representing pressing the space bar is `" "`.

Try out `lengthen-with-reset` by creating a `big-bang` animation with `lengthen-with-reset` as the key handler and `draw`. Run the animation, play with it, and comment it out when you are done.

---

## 3. Book Exercises

Complete **Exercises 83, 84, and 85** from Chapter 5 of the book. To receive full credit, you must design and use the helper functions mentioned in **Exercise 84**:

- `string-first`
- `string-rest`
- `string-last`
- `string-remove-last`


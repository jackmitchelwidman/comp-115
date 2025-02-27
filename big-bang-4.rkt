;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname big-bang-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/universe)
(require 2htdp/image)

(define INITIAL-SIZE 300)
(define HALF-SIZE (/ INITIAL-SIZE 2))

;Number  -> String
(define (pick-color num)
  (cond
    ((= num 0) "red")
    ((= num 1) "blue")
    ((= num 2) "green")
    ((= num 3) "yellow")
     (else "purple")))
          

(define (number->square size)
      (square size "solid" (pick-color (random 5))))   ;

(big-bang INITIAL-SIZE
    [to-draw number->square]
    [on-tick sub1]
    [stop-when zero?]
)


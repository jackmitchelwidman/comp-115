;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname big-bang-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define INITIAL-SIZE 800)
(define HALF-SIZE (/ INITIAL-SIZE 2))

(define (number->square s)
  (if (<= s HALF-SIZE)
      (square s "solid" "blue")   
      (square s "solid" "red")))   

(big-bang INITIAL-SIZE
    [to-draw number->square]
    [on-tick sub1]
    [stop-when zero?]
)


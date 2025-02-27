;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname one) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; World state is just the x-coordinate of our circle
(define initial-x 0)

;; Draw the world - place circle at current x position
(define (render-world x)
  (place-image (circle 20 "solid" "red")
               x 100
               (empty-scene 1000 1000)))
;; Update the world - move circle right by 1 pixels each tick
(define (update-world x)
  (+ x 1))

;; Check if the animation should stop
(define (end-world? x)
  (> x 800))

;; Run the animation
(big-bang initial-x
  [to-draw render-world]    ; how to draw the world
  [on-tick update-world .001]    ; how to update on each clock tick
  [stop-when end-world?])   ; when to stop


;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname two) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; World state is a position with x and y coordinates
(define-struct pos (x y))
(define initial-pos (make-pos 0 0))


;define some constants
(define SCENE-WIDTH 1000)
(define SCENE-HEIGHT 700)
(define CIRCLE-RADIUS 20)
(define TARGET-X (/ SCENE-WIDTH 2))  ; Middle of the screen
(define BOTTOM-Y (- SCENE-HEIGHT CIRCLE-RADIUS))  ; Bottom position accounting for radius

;; Draw the world - place circle at current position
(define (render-world p)
  (place-image (circle CIRCLE-RADIUS "solid" "red")
               (pos-x p) (pos-y p)
               (empty-scene SCENE-WIDTH SCENE-HEIGHT)))

;; Calculate how much to move in x direction per tick
;; This ensures we reach the center (TARGET-X) when y reaches BOTTOM-Y
(define x-step (/ TARGET-X BOTTOM-Y))

;; Update the world - move circle along the calculated slope
(define (update-world p)
  (make-pos (+ (pos-x p) (* x-step 3))  ; x increases proportionally
            (+ (pos-y p) 3)))           ; y increases by 3 each time
;Check if the animation should stop - when ball hits bottom
(define (end-world? p)
  (>= (pos-y p) BOTTOM-Y))

;Run the animation
(big-bang initial-pos
  [to-draw render-world]    ; how to draw the world
  [on-tick update-world .01]    ; how to update on each clock tick
  [stop-when end-world?])   ; when to stop



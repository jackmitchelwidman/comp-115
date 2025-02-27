;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname five) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; World state is a ball with position and velocity
(define-struct ball (x y vx vy))

;; Constants
(define SCENE-WIDTH 1000)
(define SCENE-HEIGHT 600)
(define CIRCLE-RADIUS 20)
(define RIGHT-EDGE (- SCENE-WIDTH CIRCLE-RADIUS))  ; Right edge accounting for radius
(define LEFT-EDGE CIRCLE-RADIUS)                   ; Left edge accounting for radius
(define BOTTOM-EDGE (- SCENE-HEIGHT CIRCLE-RADIUS)) ; Bottom edge accounting for radius
(define TOP-EDGE CIRCLE-RADIUS)                    ; Top edge accounting for radius
(define X-VELOCITY 3)                              ; Initial x velocity
(define Y-VELOCITY 3)                              ; Initial y velocity

;; Create the initial ball at top left with downward-right velocity
(define initial-ball (make-ball LEFT-EDGE TOP-EDGE X-VELOCITY Y-VELOCITY))

;; Draw the world - place circle at current position
;; ball -> image
(define (render-world b)
  (place-image (circle CIRCLE-RADIUS "solid" "red")
               (ball-x b) (ball-y b)
               (empty-scene SCENE-WIDTH SCENE-HEIGHT)))

;; Calculate new x position
;; ball -> number
(define (calc-new-x b)
  (+ (ball-x b) (ball-vx b)))

;; Calculate new y position
;; ball -> number
(define (calc-new-y b)
  (+ (ball-y b) (ball-vy b)))

;; Determine the new x-position considering left and right walls
;; number -> number
(define (adjusted-x-pos new-x)
  (cond
    [(<= new-x LEFT-EDGE) LEFT-EDGE]
    [(>= new-x RIGHT-EDGE) RIGHT-EDGE]
    [else new-x]))

;; Determine the new y-position considering top and bottom walls
;; number -> number
(define (adjusted-y-pos new-y)
  (cond
    [(<= new-y TOP-EDGE) TOP-EDGE]
    [(>= new-y BOTTOM-EDGE) BOTTOM-EDGE]
    [else new-y]))

;; Determine if x velocity should be reversed due to wall collision
;; number number -> number
(define (adjusted-x-vel new-x vx)
  (cond
    [(<= new-x LEFT-EDGE) (- vx)]
    [(>= new-x RIGHT-EDGE) (- vx)]
    [else vx]))

;; Determine if y velocity should be reversed due to wall collision
;; number number -> number
(define (adjusted-y-vel new-y vy)
  (cond
    [(<= new-y TOP-EDGE) (- vy)]
    [(>= new-y BOTTOM-EDGE) (- vy)]
    [else vy]))

;; Calculate complete new ball state after applying velocity and bouncing
;; ball -> ball
(define (update-world b)
  (make-ball 
   (adjusted-x-pos (calc-new-x b))
   (adjusted-y-pos (calc-new-y b))
   (adjusted-x-vel (calc-new-x b) (ball-vx b))
   (adjusted-y-vel (calc-new-y b) (ball-vy b))))

;; Run the animation
(big-bang initial-ball
  [to-draw render-world]    ; how to draw the world
  [on-tick update-world .01])   ; how to update on each clock tick

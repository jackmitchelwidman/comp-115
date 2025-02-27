;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname three) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; World state is a ball with position and velocity
(define-struct ball (x y vx vy))

;; Constants
(define SCENE-WIDTH 400)
(define SCENE-HEIGHT 300)
(define CIRCLE-RADIUS 20)
(define BOTTOM-Y (- SCENE-HEIGHT CIRCLE-RADIUS))  ; Bottom position accounting for radius
(define TOP-Y CIRCLE-RADIUS)                      ; Top position accounting for radius
(define X-VELOCITY 3)                             ; Initial x velocity
(define Y-VELOCITY 3)                             ; Initial y velocity

;; Create the initial ball at top left with downward-right velocity
(define initial-ball (make-ball 0 0 X-VELOCITY Y-VELOCITY))

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

;; Check if ball should bounce
;; number -> boolean
(define (should-bounce? new-y)
  (>= new-y BOTTOM-Y))

;; Create a ball that has bounced
;; number number number -> ball
(define (make-bounced-ball new-x new-y vx)
  (make-ball new-x BOTTOM-Y vx (- Y-VELOCITY)))

;; Create a ball that has not bounced
;; number number number number -> ball
(define (make-normal-ball new-x new-y vx vy)
  (make-ball new-x new-y vx vy))

;; Update the world - move circle according to velocity
;; ball -> ball
(define (update-world b)
  (cond
    [(should-bounce? (calc-new-y b))
     (make-bounced-ball (calc-new-x b) (calc-new-y b) (ball-vx b))]
    [else
     (make-normal-ball (calc-new-x b) (calc-new-y b) (ball-vx b) (ball-vy b))]))

;; Run the animation
(big-bang initial-ball
  [to-draw render-world]    ; how to draw the world
  [on-tick update-world])   ; how to update on each clock tick

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pong3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Constants
(define WIDTH 1000)
(define HEIGHT 1000)
(define PADDLE-WIDTH 15)
(define PADDLE-HEIGHT 150)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define START-X (- WIDTH 20))
(define START-Y (/ HEIGHT 2))
(define BALL-RADIUS 20)
(define BALL-SPEED 5)  ;; Speed of ball movement

;;New constants
(define BALL-DIRECTION-RIGHT 1)
(define BALL-DIRECTION-LEFT -1)

;; Structures
(define-struct pos [x y])  ;; For paddle position

;;Added ball direction to game
(define-struct game [paddle-pos ball-pos ball-direction])  ;; Combined game state

;; Initial values
(define INITIAL-PADDLE-POS (make-pos START-X START-Y))
(define INITIAL-BALL-POS (make-pos 50 500))  ;; Start ball on left side
(define INITIAL-STATE (make-game INITIAL-PADDLE-POS INITIAL-BALL-POS BALL-DIRECTION-RIGHT))

;; Visual elements
(define paddle (rectangle PADDLE-WIDTH PADDLE-HEIGHT "solid" "grey"))
(define ball (circle BALL-RADIUS "solid" "black"))

;; Render function
(define (render state)
  (place-image ball 
               (pos-x (game-ball-pos state)) 
               (pos-y (game-ball-pos state))
               (place-image paddle 
                            (pos-x (game-paddle-pos state)) 
                            (pos-y (game-paddle-pos state)) 
                            BACKGROUND)))

;; Key handling
(define (handle-key state key)
  (cond
    [(key=? key "up") 
     (make-game 
      (make-pos (pos-x (game-paddle-pos state)) 
                (- (pos-y (game-paddle-pos state)) 20))
      (game-ball-pos state)
      (game-ball-direction state))]
    [(key=? key "down") 
     (make-game 
      (make-pos (pos-x (game-paddle-pos state)) 
                (+ (pos-y (game-paddle-pos state)) 20))
      (game-ball-pos state)
      (game-ball-direction state))]
    [else state]))

;; Helper functions for move-ball
(define (get-new-x current-x direction)
  (+ current-x (* BALL-SPEED direction)))

(define (get-ball-right-edge ball-x)
  (+ ball-x BALL-RADIUS))

(define (get-ball-left-edge ball-x)
  (- ball-x BALL-RADIUS))

(define (get-paddle-left-edge paddle-x)
  (- paddle-x (/ PADDLE-WIDTH 2)))

(define (get-paddle-right-edge paddle-x)
  (+ paddle-x (/ PADDLE-WIDTH 2)))

(define (get-paddle-top-edge paddle-y)
  (- paddle-y (/ PADDLE-HEIGHT 2)))

(define (get-paddle-bottom-edge paddle-y)
  (+ paddle-y (/ PADDLE-HEIGHT 2)))

;; To determine if the ball hits the paddle, we have to consider
;; five conditions. 
(define (paddle-hit? ball-x ball-y paddle-x paddle-y direction)
  (and (>= (get-ball-right-edge ball-x) (get-paddle-left-edge paddle-x))
       (<= (get-ball-right-edge ball-x) (get-paddle-right-edge paddle-x))
       (>= ball-y (get-paddle-top-edge paddle-y))
       (<= ball-y (get-paddle-bottom-edge paddle-y))
       (= direction BALL-DIRECTION-RIGHT)))

(define (left-wall-hit? ball-x direction)
  (and (<= (get-ball-left-edge ball-x) 0)
       (= direction BALL-DIRECTION-LEFT)))

(define (get-new-direction ball-x ball-y paddle-x paddle-y current-direction)
  (cond
    [(paddle-hit? ball-x ball-y paddle-x paddle-y current-direction) BALL-DIRECTION-LEFT]
    [(left-wall-hit? ball-x current-direction) BALL-DIRECTION-RIGHT]
    [else current-direction]))

(define (get-new-ball-pos ball-x ball-y paddle-x paddle-y current-direction new-x)
  (cond
    [(paddle-hit? ball-x ball-y paddle-x paddle-y current-direction) 
     (make-pos (- (get-paddle-left-edge paddle-x) BALL-RADIUS) ball-y)]
    [(left-wall-hit? ball-x current-direction) 
     (make-pos BALL-RADIUS ball-y)]
    [else (make-pos new-x ball-y)]))

;; Move ball function with bouncing
(define (move-ball state)
  (make-game 
   (game-paddle-pos state)
   (get-new-ball-pos 
    (pos-x (game-ball-pos state))
    (pos-y (game-ball-pos state))
    (pos-x (game-paddle-pos state))
    (pos-y (game-paddle-pos state))
    (game-ball-direction state)
    (get-new-x (pos-x (game-ball-pos state)) (game-ball-direction state)))
   (get-new-direction
    (pos-x (game-ball-pos state))
    (pos-y (game-ball-pos state))
    (pos-x (game-paddle-pos state))
    (pos-y (game-paddle-pos state))
    (game-ball-direction state))))

;; Start the game
(big-bang INITIAL-STATE  ;big-bang needs a game object
  [to-draw render]
  [on-key handle-key]
  [on-tick move-ball 1/100])
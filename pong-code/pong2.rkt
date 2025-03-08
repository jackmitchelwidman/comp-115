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
(define BALL-SPEED 5)  
(define HALF-OF-PADDLE-WIDTH (/ PADDLE-WIDTH 2))
(define paddle (rectangle PADDLE-WIDTH PADDLE-HEIGHT "solid" "grey"))
(define ball (circle BALL-RADIUS "solid" "black"))

;; Structs
(define-struct pos [x y])  ;; For paddle position
(define-struct game [paddle-pos ball-pos])  ;; Combined game state

;; Constants that use structs
(define INITIAL-PADDLE-POS (make-pos START-X START-Y))
(define INITIAL-BALL-POS (make-pos 50 500))  ;; Start ball on left side
(define INITIAL-STATE (make-game INITIAL-PADDLE-POS INITIAL-BALL-POS))

;; Functions
(define (center-of-paddle paddle-x)
  paddle-x)

(define (paddle-left-edge paddle-x)
  (- (center-of-paddle paddle-x)  HALF-OF-PADDLE-WIDTH))

(define (ball-right-edge ball-x)
  (+ ball-x BALL-RADIUS))

(define (render state)
  (place-image ball 
               (pos-x (game-ball-pos state)) 
               (pos-y (game-ball-pos state))

               (place-image paddle 
                            (pos-x (game-paddle-pos state)) 
                            (pos-y (game-paddle-pos state)) 
                            BACKGROUND)))


(define (handle-key state key)
  (cond
    [(key=? key "up") 
     (make-game 
      (make-pos (pos-x (game-paddle-pos state)) 
                (- (pos-y (game-paddle-pos state)) 10))
      (game-ball-pos state))]
    [(key=? key "down") 
     (make-game 
      (make-pos (pos-x (game-paddle-pos state)) 
                (+ (pos-y (game-paddle-pos state)) 10))
      (game-ball-pos state))]
    [else state]))



(define (ball-at-edge? ball-x paddle-x)
  (> (ball-right-edge ball-x)  (paddle-left-edge paddle-x)))


;; Helper function to adjust x position if it touches the paddle
(define (adjust-x-position ball-x paddle-x)
  (if (ball-at-edge? ball-x paddle-x)
      ;; Position ball so its right edge touches paddle's left edge
      (- paddle-x (/ PADDLE-WIDTH 2) BALL-RADIUS)
      ball-x))


(define (move-ball state)
  (make-game
   (game-paddle-pos state)
   (make-pos 
    (adjust-x-position 
     (new-x-position (pos-x (game-ball-pos state)))
     (pos-x (game-paddle-pos state)))
    (pos-y (game-ball-pos state)))))

;; Helper function to calculate new x position
(define (new-x-position current-x)
  (+ current-x BALL-SPEED))

;; Start the game
(big-bang INITIAL-STATE  ;big-bang needs a game object
  [to-draw render]
  [on-key handle-key]
  [on-tick move-ball 1/100])


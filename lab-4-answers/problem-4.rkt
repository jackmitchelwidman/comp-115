(require 2htdp/universe)
(require 2htdp/image)

;;A structure that represents a point on the screen. It has an x and a y coordinate. 
(define-struct pos [x y])

(define BACKGROUND (empty-scene 1000 1000))

(define INITIAL-STATE  (make-pos 100 100))

;; pos -> image
;; This displays a black square at the position  that corresponds to the position called state. 
(define (render-world state)
  (place-image (square 20 "solid" "black")
               (pos-x state)
               (pos-y state)
               BACKGROUND))

;; pos -> pos
;; This updates the state (the position) according to whether the square's x coordinate is
;; less than the midpoint of the screen. If it is, it moves the square to the right, and if its not
;; it moves the square down. 
(define (update-world state)
  (if
     (< (pos-x state) 500)
     (make-pos (+ 1 (pos-x state)) (pos-y state))
     (make-pos (pos-x state) (+ 1 (pos-y state)))))

(big-bang INITIAL-STATE
    [to-draw render-world]
    [on-tick update-world 0.001])  

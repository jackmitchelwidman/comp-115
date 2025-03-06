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


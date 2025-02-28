(require 2htdp/universe)
(require 2htdp/image)

(define-struct worldxy [x y])
(define BACKGROUND (empty-scene 1000 1000))
(define INITIAL-STATE  (make-worldxy 100 100))

(define (render-world state)
  (place-image (square 20 "solid" "black")
               (worldxy-x state)
               (worldxy-y state)
               BACKGROUND))

(define (update-world state)
  (if
     (< (worldxy-x state) 500)
     (make-worldxy (+ 1 (worldxy-x state)) (worldxy-y state))
     (make-worldxy (worldxy-x state) (+ 1 (worldxy-y state)))))

(big-bang INITIAL-STATE
    [to-draw render-world]
    [on-tick update-world 0.001])  

 

 

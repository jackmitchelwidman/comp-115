(require 2htdp/universe)
(require 2htdp/image)

(define-struct pos [x y])
(define BACKGROUND (empty-scene 1000 1000))
(define INITIAL-STATE  (make-pos 100 100))

(define (render-world state)
  (place-image (square 20 "solid" "black")
               (pos-x state)
               (pos-y state)
               BACKGROUND))

(define (update-world state)
  (if
     (< (pos-x state) 500)
     (make-pos (+ 1 (pos-x state)) (pos-y state))
     (make-pos (pos-x state) (+ 1 (pos-y state)))))

(big-bang INITIAL-STATE
    [to-draw render-world]
    [on-tick update-world 0.001])  

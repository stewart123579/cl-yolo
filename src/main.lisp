(defpackage cl-yolo
  (:use :cl)
  (:export :yolo-to-xy))

(in-package :cl-yolo)


(defun yolo-to-xy (width height yolo)
  "Convert YOLO data to X,Y using WIDTH and HEIGHT data

Returns CLASS X0 Y0 X1 Y1
where X and Y are pixels and _0 is top left corner and _1 is bottom right of the
bounding box.

> The bounding boxes have to be listed as one bounding box per line, with on
> that line:
>   - the class number of the object in the bounding box (always 0 if only one
>     class)
>   - the standardized center pixel of the bounding box in terms of width
>   - the standardized center pixel of the bounding box in terms of height
>   - the standardized width of the bounding box
>   - the standardized height of the bounding box
"
  (let ((class (car yolo))
        (centre-x (nth 1 yolo))
        (centre-y (nth 2 yolo))
        (width-x (/ (nth 3 yolo) 2))
        (width-y (/ (nth 4 yolo) 2)))
    (mapcar (lambda (p) (round p))
            (list class
                  ;; Top left
                  (* width (- centre-x width-x)) (* height (- centre-y width-y))
                  ;; Bottom right
                  (* width (+ centre-x width-x)) (* height (+ centre-y width-y))))))

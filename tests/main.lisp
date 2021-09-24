(defpackage cl-yolo/tests/main
  (:use :cl
        :cl-yolo
        :rove))
(in-package :cl-yolo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-yolo)' in your Lisp.

(deftest test-target-1
  (testing "do we return the correct xy pairs?"
    (ok (let ((yolo (list 0 0.456250 0.142969 0.071875 0.035937))
              (result (list 0 269 80 315 103)))
          (equal (cl-yolo:yolo-to-xy 640 640 yolo)
                 result)))))

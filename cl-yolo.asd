(defsystem "cl-yolo"
  :version "0.1.0"
  :author "Stewart V. Wright <stewart@vifortech.com>"
  :license "BSD"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Interfacing between YOLO (object detection) file formats and common lisp"
  :in-order-to ((test-op (test-op "cl-yolo/tests"))))

(defsystem "cl-yolo/tests"
  :author "Stewart V. Wright <stewart@vifortech.com>"
  :license "BSD"
  :depends-on ("cl-yolo"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-yolo"
  :perform (test-op (op c) (symbol-call :rove :run c)))

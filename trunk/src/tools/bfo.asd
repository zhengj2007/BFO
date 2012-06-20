;;;; -*- Mode: LISP -*-
;;;;

(in-package :asdf)

;; bfo:**;**;*.* -> bfo/trunk/**/*.*

(setf (logical-pathname-translations "bfo")
      `(
	("**;*.*" ,(make-pathname :directory (append (butlast (pathname-directory *load-pathname*) 2) '(:wild-inferiors))
				    :name :wild
				    :type :wild))
	))

(defsystem :bfo
    :name "tools for maintaining/building bfo"
    :author "Alan Ruttenberg"
    :licence "BSD"
    :components
    ((:module jars 
	      :serial t
	      :pathname ""
	      :components
	      ((:jar-directory "lib")))
     (:module spec :pathname "specifications"
	      :components
	      ((:static-file "bfo2-reference.lisp")
	       (:static-file "bfo2-uris")))
     (:module parse :pathname "" :depends-on (spec)
	      :components
	      ((:file "parse-specification")))
     (:module process :pathname ""
	      :components
	      ((:file "extract-reference-annotations")
	       (:file "process-axioms")
	       (:file "generate-bfo2")
	       (:file "bfo2-annotations")
	       )))
    :depends-on (owl2))

;;;; eof

;;; -*- Lisp -*-

;;; Reader-conditional eliminates the second component's name on every
;;; CL implementation (#+test-asdf-no-such-feature is always false), so
;;; the form after reader expansion is `(:file)`. parse-defsystem should
;;; treat that as "skip this component" rather than erroring with
;;; DUPLICATE-NAMES on the implicit nil-name find-component lookup.

(defsystem :file-name-nil
  :components
  ((:file "file1")
   (:file #+test-asdf-no-such-feature "shouldnt-build")))

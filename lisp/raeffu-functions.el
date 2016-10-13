(require 'projectile)
(require 'perspective)

(defvar t-project-location (expand-file-name "~/Projects/"))

(defmacro t-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash))))
     (persp-switch ,name)
     (when initialize ,@body)))

(defun t-project-ido-find-project ()
  (interactive)
  (let* ((project-name (completing-read "Project: "
					(directory-files t-project-location nil "^[^.]")))
	 (project-path (concat t-project-location project-name)))
    (t-persp project-name)
    (let ((default-directory project-path))
      (projectile-find-file))))

(provide 'raeffu-functions)

# .emacs.d

Make a .emacs file in ~/AppData/Roaming/ and insert the following into it:

(setq user-init-file "C:/Users/henrik.karlsson/.emacs.d/init.el")
(setq user-emacs-directory "C:/Users/henrik.karlsson/.emacs.d")
(setq default-directory "C:/Users/henrik.karlsson/")
(setenv "HOME" "C:/Users/henrik.karlsson/")
(load user-init-file)

This will set the home directories to be more in line with what you'd expect, and you can have your actual emacs initialization files in ~/.emacs.d/
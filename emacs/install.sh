echo "Installing emacs"

cp -r .emacs.d/ ~/
cp -r .emacs ~/
cp -r .myemacs ~/

echo "Installing header. Choose No if already exist :)"
cp -i .std* ~/
mkdir ~/.emacs_backups

echo "Please change your name and login on .std-comment.el";

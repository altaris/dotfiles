#!/usr/bin/env sh

FILE="vscode-extension-install.sh"

echo "#!/usr/bin/env sh" > $FILE
code --list-extensions | xargs -L 1 echo "code --install-extension" | tee -a $FILE
chmod u+x $FILE


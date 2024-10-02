# Ajuste de Ruby Gems para pasta do usuario
export GEM_HOME="$HOME/.gem"
export PATH=$GEM_HOME/bin:$PATH
export PATH=${HOME}/Applications/brew/bin:${PATH}

if which swiftlint >/dev/null; then
    swiftlint
else
    echo "SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
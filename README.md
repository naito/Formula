# homebrew-ecell
Homebrew Formulas to install E-Cell3 and related packages.

## Install
```
brew install python
```
add the following to `~/.bash_profile` or `~/.profile` etc.:
```
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
```
install packages
```
brew install numpy --without-python3
pip install --upgrade pip setuptools
pip install ply
brew tap naito/ecell
brew install ecell3
```

## Update
```
brew update
brew upgrade ecell3
```


## Note
Typically installed in `/usr/local/Library/Taps/naito/homebrew-ecell`

# homebrew-ecell
Homebrew Formulas to install E-Cell3 and related packages.

- [E-Cell3 3.2.6](https://github.com/naito/ecell3)
- [libSBML 5.15.0](http://sbml.org/Software/libSBML)

## Install

### Install Homebrew
[Homebrew web site](https://brew.sh)

### Install brewed Python
```
brew install python
```

### Edit profile for schell
``` 
cat << 'EOS' >> ~/.profile

# PATH for brewed Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
EOS
```
- Activate the added `PATH`
```
$ source ~/.profile
```

### Install required Python packages
```
pip install --upgrade pip setuptools
pip install numpy
pip install ply
```

### Install E-Cell3
```
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

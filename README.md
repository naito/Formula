# homebrew-ecell
Homebrew Formulas to install E-Cell3 and related packages.

- [E-Cell3 3.2.7](https://github.com/naito/ecell3)

## Install

### Install Homebrew
[Homebrew web site](https://brew.sh)

### Install brewed Python2
```
brew install python@2
```

### Install required Python packages
```
pip install --upgrade pip setuptools
pip install numpy ply python-libsbml
```

### Install Python packages required for ecell3-jupyter
```
pip install matplotlib scipy sympy
pip install ipython[all]
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
Typically installed in `/usr/local/Cellar/ecell3/3.2.7d_2`
Formula files are typically installed in `/usr/local/Homebrew/Library/Taps/naito/homebrew-ecell`

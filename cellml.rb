require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cellml < Formula
  homepage ''
  # url 'http://sourceforge.net/projects/cellml-api/files/CellML-API-Nightly/1.12/20121031/src/cellml-api-1.12.tar.bz2/download'
  url 'http://sourceforge.net/projects/cellml-api/files/CellML-API-Nightly/1.13/20130716/src/cellml-api-1.13.tar.bz2/download'
  sha256 ''

  depends_on 'cmake' => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'gsl'
  depends_on 'omniorb'

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                       "--disable-dependency-tracking",
    #                       "--disable-silent-rules",
    #                       "--prefix=#{prefix}"
    system "cmake", "-LA", ".", *std_cmake_args
    # system "make", "all"
    # system "make", "test"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test cellml`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "--version"`.
    system "false"
  end
end

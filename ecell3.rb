require 'formula'

class Ecell3 < Formula
  version '3.2.3.140919i'
  homepage 'https://github.com/ecell/ecell3'
  url 'https://github.com/ecell/ecell3/archive/naito-ipython.tar.gz'
  sha1 '424df4e3fc140efb66ed0e4435b149c39eb76c44'

  depends_on :x11
  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on :python => ["2.7", :recommended]
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
#  depends_on 'libsbml'
  depends_on 'numpy' => :python
  depends_on 'ply' => :python
  depends_on 'docopt' => :python
  depends_on 'schema' => :python
#  depends_on 'python-libsbml' => :python

  def install
    system "sh", "./autogen.sh"
    system "./configure", "--with-boost-python-libname=boost_python-mt",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules", 
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end

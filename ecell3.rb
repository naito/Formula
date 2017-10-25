require 'formula'

class Ecell3 < Formula
  version "3.2.6"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/releases/download/ecell-3.2.6/ecell-3.2.6.tar.gz'
  sha256 'a918a62ab5677bb36d06f2667918c77c7188b559c432620440925d0953624d37'

  depends_on :x11
  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on :python => ["2.7", :recommended]
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
  depends_on 'libsbml'
  depends_on 'numpy' => :python
  depends_on 'ply' => :python
  depends_on 'readline' => :python
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

require 'formula'

class Ecell3 < Formula
  version "3.2.4.170605"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/archive/ecell-3.2.4d.tar.gz'
  sha256 'fb52854107132c8c6d84a0e2456f21599f747cf347a1d8f054b84b6af70bf394'

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

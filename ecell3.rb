require 'formula'

class Ecell3 < Formula
  version "3.2.5"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/releases/download/ecell-3.2.5/ecell-3.2.5.tar.gz'
  sha256 '87d2ae542e09d015e0f369576921c79bc37ec4b2593a47895887d5353da15388'

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

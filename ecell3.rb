require 'formula'

class Ecell3 < Formula
  version "3.2.4b"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/archive/ecell-3.2.4c.tar.gz'
  sha256 'e5b74b06211fbcca4c7f22db5b8e664da6be89456c897befa594e36afe6440fc'

  depends_on :x11
  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on :python => ["2.7", :recommended]
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
#  depends_on 'libsbml'
  depends_on 'numpy' => :python
  depends_on 'ply' => :python
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

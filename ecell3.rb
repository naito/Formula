require 'formula'

class Ecell3 < Formula
  homepage 'https://github.com/ecell/ecell3'
  url 'https://github.com/ecell/ecell3.git', :using => :git
  sha1 '7237ac785e2f8ad64f70f77da8fcf1d880cbca4a'
#  url 'https://github.com/ecell/ecell3/archive/naito-SBML2EML.tar.gz'
#  sha1 '6d4b5f57ed692386a1969dbf8dd5d50a493fd456'

  depends_on :x11
  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on :python => ["2.7", :recommended]
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
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

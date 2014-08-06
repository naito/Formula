require 'formula'

class Ecell3 < Formula
  homepage 'https://github.com/ecell/ecell3'
#  url 'https://github.com/ecell/ecell3.git', :using => :git
#  sha1 'c7bc6a690e59725176bf3b5d1a762ad44a81b866'
#  url 'https://github.com/ecell/ecell3/archive/naito-SBML2EML.tar.gz'
#  sha1 '6d4b5f57ed692386a1969dbf8dd5d50a493fd456'
#  url 'https://github.com/ecell/ecell3/archive/naito-StepperDebug.tar.gz'
#  sha1 'f96255e61b9d21991a9429240bec6bcdcd58d76f'
  url 'https://github.com/ecell/ecell3/archive/empy3.3.2.tar.gz'
  sha1 'a03cb071617304b9d91e6f362f0c03160ef4f09d'

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

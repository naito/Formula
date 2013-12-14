require 'formula'

class Ecell3 < Formula
  homepage 'https://github.com/ecell/ecell3'
#  url 'https://api.github.com/repos/ecell/ecell3/tarball/8b8dceeba31895618c26d01cbcb1f42df690163e'
  url 'https://github.com/ecell/ecell3.git', :using => :git
  sha1 'e817378b0a8f14cbf93e7e30e72e99ce8fdb057c'

  depends_on :x11
  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on :python => ["2.7", :recommended]
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'numpy' => :python
  depends_on 'ply' => :python

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

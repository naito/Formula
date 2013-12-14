require 'formula'

class Libsbml < Formula
  homepage 'http://sbml.org/Software/libSBML'
  url 'http://sourceforge.net/projects/sbml/files/libsbml/5.9.0/stable/libSBML-5.9.0-core-src.tar.gz'
  sha1 'e2b42dfc45a9a1a88da73253ff3655ce5e25a6f1'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'libxml2'
  depends_on :python => ["2.7", :recommended]
  depends_on 'swig'

  def install

    system "./configure", "--prefix=#{prefix}",
                          "--with-libxml",
                          "--with-swig",
                          "--with-java",
                          "--with-python"
    system "make", "install"
  end

  test do
    system "false"
  end
end

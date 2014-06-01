require 'formula'

class Libsbml < Formula
  homepage 'http://sbml.org/Software/libSBML'
#  url 'http://sourceforge.net/projects/sbml/files/libsbml/5.9.0/stable/libSBML-5.9.0-core-src.tar.gz'
#  sha1 'e2b42dfc45a9a1a88da73253ff3655ce5e25a6f1'
  url 'http://sourceforge.net/projects/sbml/files/libsbml/5.10.0/stable/libSBML-5.10.0-core-src.tar.gz'
  sha1 'a428d0992d384dd0d023644b04072e7f922c33c9'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
#  depends_on "cmake" => :build
  depends_on 'libxml2'
#  depends_on 'expat'
  depends_on :python => ["2.7", :recommended]
  depends_on 'swig'

  def install

    ENV['ARCHFLAGS'] = "ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future"
    system "./configure", "--prefix=#{prefix}",
                          "--with-libxml",
#                          "--with-expat",
                          "--with-swig",
                          "--with-java",
#                          "--with-python", "--with-python-interpreter=/usr/bin/python2.7"
                          "--without-python"
    system "make", "install"

#    system "mkdir", "./build"
#    system "cd", "build/"
#    system "cmake", "..", "-DCMAKE_INSTALL_PREFIX=#{prefix}",
#                          "-DWITH_EXPAT=ON",
#                          "-DWITH_SWIG=ON",
#                          "-DWITH_JAVA=ON",
#                          "-DWITH_PYTHON=ON"

  end

  test do
    system "false"
  end
end

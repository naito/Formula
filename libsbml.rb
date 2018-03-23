require 'formula'

class Libsbml < Formula
  homepage 'http://sbml.org/Software/libSBML'
  url 'http://sourceforge.net/projects/sbml/files/libsbml/5.15.0/stable/libSBML-5.15.0-core-src.tar.gz'
  sha256 'f975bd1fe379cc7027fd3fed9d6ae92e6dd61dda09befdfd2ffb969c324a5c28'

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on 'libxml2'
  depends_on :python@2 => ["2.7", :recommended]
  depends_on 'swig'

  def install

    ENV['ARCHFLAGS'] = "ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future"
    system "./configure", "--prefix=#{prefix}",
                          "--with-libxml",
                          "--with-swig",
                          "--without-python"
    system "make", "install"

  end

  test do
    system "false"
  end
end

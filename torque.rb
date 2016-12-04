require 'formula'

class Torque < Formula
  version "current"
  homepage 'http://www.adaptivecomputing.com/products/open-source/torque/'
#  url 'http://www.adaptivecomputing.com/download/torque/torque-6.1.0.tar.gz'
#  sha256 '74d857e22f1082ed2fb2ba7976c129b73791177f504e10ce10362a6e8a9e1c8a'
  url 'https://github.com/adaptivecomputing/torque.git', :using => :git
#  url 'https://github.com/adaptivecomputing/torque/archive/v5.1.1.tar.gz'
#  sha256 '22d077d6732b99987cb63aa738be2b4860e951335aa0705d06e4341ad8c287ee'

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on 'libxml2'
  depends_on 'openssl'
  depends_on 'homebrew/dupes/tcl-tk'
  depends_on 'boost'

  def install
   inreplace "autogen.sh", "libtoolize", "glibtoolize"
   system "sh", "./autogen.sh"

   inreplace "configure", "${xmlLib}", "xml2"
   inreplace "configure", "[AC_MSG_ERROR([TORQUE needs libxml2-devel in order to build]) ]", "[]"
    system "./configure", "--enable-cgroups",
                          "--with-hwloc-path=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end

require 'formula'

class Torque62 < Formula
  version "6.1.0"
  homepage 'http://www.adaptivecomputing.com/products/open-source/torque/'
  url 'http://www.adaptivecomputing.com/download/torque/torque-6.1.0.tar.gz'
  sha1 '6edd7c6e362cc6f66ceba5be0d8440a124c2d23e'
#  url 'https://github.com/adaptivecomputing/torque.git', :using => :git

  depends_on :libxml2
  depends_on :openssl
  depends_on :homebrew/dupes/tcl-tk
  depends_on 'boost'

  def install
    system "sh", "./autogen.sh"
    system "./configure", "---enable-cgroups",
                          "--with-hwloc-path=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end

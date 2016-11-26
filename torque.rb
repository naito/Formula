require 'formula'

class Torque < Formula
  version "6.1.0"
  homepage 'http://www.adaptivecomputing.com/products/open-source/torque/'
#  url 'http://www.adaptivecomputing.com/download/torque/torque-6.1.0.tar.gz'
#  sha256 '2a76396253755e4a71a42f0eb7a7d4b96128f8360f4db19029ee10eeb26efa0b'
  url 'https://github.com/adaptivecomputing/torque.git', :using => :git
  sha256 '2a76396253755e4a71a42f0eb7a7d4b96128f8360f4db19029ee10eeb26efa0b'

  depends_on 'libxml2'
  depends_on 'openssl'
  depends_on 'homebrew/dupes/tcl-tk'
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

require 'formula'

class Ecell3 < Formula
  version "3.2.7c"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/releases/download/ecell-3.2.7/ecell-3.2.7.tar.gz'
  sha256 '7f442b644b77b3732c315993256bcc33257602c41076b85673a39f420cfcc290'

  depends_on :x11
  depends_on "python@2" if MacOS.version <= :snow_leopard
  depends_on 'python'
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
#  depends_on 'libsbml'
  depends_on 'numpy' => :recommended
#  depends_on 'ply' => : recommended
  depends_on 'readline' => :recommended

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules", 
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end

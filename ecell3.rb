require 'formula'

class Ecell3 < Formula
  version "3.2.7d"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/releases/download/ecell-3.2.7/ecell-3.2.7.tar.gz'
  sha256 '7f442b644b77b3732c315993256bcc33257602c41076b85673a39f420cfcc290'

  devel do
    url "https://github.com/naito/ecell3/archive/session-monitor-2018.tar.gz"
    sha256 "e34fce73e53029d1ce7f51b4e4e0554402d5a902761731bb22783618c681650f"
  end

  depends_on :x11
#  depends_on "python@2" if MacOS.version <= :snow_leopard
  depends_on 'python'
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
  depends_on 'libsbml'
  depends_on 'numpy' => :recommended
# depends_on 'ply' => :recommended
  depends_on 'readline' => :recommended

  def install

    devel do
      system "./autogen.sh"
    end

    system "./configure", "--with-boost-python-libname=boost_python27-mt", 
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

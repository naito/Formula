require 'formula'

class Ecell3 < Formula
  version "3.2.7d"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/releases/download/ecell-3.2.7/ecell-3.2.7.tar.gz'
  sha256 '7f442b644b77b3732c315993256bcc33257602c41076b85673a39f420cfcc290'
  revision 2

$devel = false

  devel do
$devel = true
    url "https://github.com/naito/ecell3/archive/session-monitor-2018.tar.gz"
    sha256 "ad54f2eacc5c9a3295dda2c6cab3e11118ed164188105a7b78930b6dd8295ecd"
  end

  depends_on :x11
#  depends_on "python@2" if MacOS.version <= :snow_leopard
#  depends_on 'python'
  depends_on 'python@2'
  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
# depends_on 'libsbml'
# depends_on 'numpy' => :recommended
# depends_on 'ply' => :recommended
  depends_on 'readline' => :recommended

  # https://pypi.org

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/45/ba/2a781ebbb0cd7962cc1d12a6b65bd4eff57ffda449fdbbae4726dc05fbc3/numpy-1.15.2.zip"
    sha256 "27a0d018f608a3fe34ac5e2b876f4c23c47e38295c47dd0775cc294cd2614bc1"
  end

  resource "ply" do
    url "https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da/ply-3.11.tar.gz"
    sha256 "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
  end

  resource "python-libsbml" do
    url "https://files.pythonhosted.org/packages/cc/44/5f3504d6f5c10e6e877d51ff280f2f4ed4effbc56f59d5b935881bed9e65/python-libsbml-5.17.0.tar.gz"
    sha256 "3174b68588a395e9365fff9bcb19692d583525980bc21f33ccee9f3cd45cecfe"
  end

#  patch :DATA
#  patch :p0, :DATA

  def install

    ## if $devel == true then
    ##   system "./autogen.sh"
    ## end

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

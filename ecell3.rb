require 'formula'

class Ecell3 < Formula
  version "3.2.8"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/tarball/30499e5079a94557f96282179f9572ca7019875a'
  sha256 '8c87f204c7f63b34780f0db676c523fe9d84f96efbc47604d9ce1858eaa058b2'
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
#  depends_on 'pygtk'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python'
# depends_on 'libsbml'
# depends_on 'numpy' => :recommended
# depends_on 'ply' => :recommended
  depends_on 'readline' => :recommended
  depends_on 'autoconf'
  depends_on 'libtool'
  depends_on 'automake'

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

  patch :DATA

  def install

    ## if $devel == true then
    ##   system "./autogen.sh"
    ## end

    system "./autogen.sh"
    system "./configure", "--with-boost-python-libname=boost_python27-mt",
                          "--disable-gui",
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

__END__
diff --git a/ecell/bin/ecell3-dmc.in ecell/bin/ecell3-dmc.in
index 964104f..1398e7b 100644
--- a/ecell/bin/ecell3-dmc.in
+++ ecell/bin/ecell3-dmc.in
@@ -150,8 +150,8 @@ def main():
     # -------------------------------------
     # initialize file names
     # -------------------------------------
-    STDLIBDIRS = [ '-L' + _lib_dir, '-L' + lib_dir ]
+    STDLIBDIRS = [ '-L' + _lib_dir, '-L' + lib_dir, '-L' + 'HOMEBREW_PREFIX/lib' ]
     STDINCLUDE = [ '-I' + _include_dir,
                    '-I' + include_dir,
-                   '-I' + os.path.join(include_dir, 'libecs') ]
+                   '-I' + os.path.join(include_dir, 'libecs'), '-I' + 'HOMEBREW_PREFIX/include' ]
     SRC = None

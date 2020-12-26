require 'formula'

class Ecell33 < Formula
  version "3.3-alpha.2"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/archive/ecell-3.3-alpha.2.tar.gz'
  sha256 '401063b2101f685ea03eeab37dcbaa9139e6d8509b4200130468b6735042cd77'
  revision 1

  depends_on :x11
  depends_on 'python'
  depends_on 'pygobject3'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python3'
  depends_on 'readline' => :recommended
  depends_on 'autoconf'
  depends_on 'libtool'
  depends_on 'automake'

  patch :DATA

  def install

    system "./autogen.sh"

    system "./configure", "--with-boost-python-libname=boost_python39-mt",
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

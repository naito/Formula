require 'formula'

class Ecell33 < Formula
  version "3.3-alpha.1"
  homepage 'https://github.com/naito/ecell3'
  url 'https://github.com/naito/ecell3/archive/ecell-3.3-alpha.1.tar.gz'
  sha256 '257ad2350f3b9478443e325c72d24586349ac56c04d82fb03b327e3a2df3127f'
  revision 1

  depends_on :x11
  depends_on 'python'
  depends_on 'pygobject3'
  depends_on 'gsl'
  depends_on 'boost'
  depends_on 'boost-python3'
  depends_on 'readline' => :recommended


  patch :DATA

  def install

    system "./autogen.sh"

    system "./configure", "--with-boost-python-libname=boost_python37-mt",
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

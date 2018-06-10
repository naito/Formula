class Glade38 < Formula
  desc "RAD tool for the GTK+ and GNOME environment"
  homepage "https://glade.gnome.org/"
  url "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-3.8.6.tar.xz"
  sha256 "aaeeebffaeb3068fb23757a2eede46adeb4c7cecc740feed7654e065491f5449"
  revision 1

  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "itstool" => :build
  depends_on "docbook-xsl" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gettext"
  depends_on "libxml2"
  depends_on "adwaita-icon-theme"
  depends_on "hicolor-icon-theme"
  depends_on "gtk+"
  depends_on "gtk-mac-integration"

  def install
    # Find our docbook catalog
    ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-gladeui",
                          "--enable-introspection"
    # objective-c is needed for glade-registration.c. unfortunately build fails if -x objective-c is added to global CFLAGS.
    # Bugreport Upstream: https://bugzilla.gnome.org/show_bug.cgi?id=768032
    inreplace "src/Makefile", "-c -o glade-glade-registration.o", "-x objective-c -c -o glade-glade-registration.o"

    system "make" # separate steps required
    system "make", "install"
  end

  test do
    system "false"
  end
end
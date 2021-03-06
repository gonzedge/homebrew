require 'formula'

class Ndiff < Formula
  desc "Virtual package provided by nmap"
  homepage 'http://www.math.utah.edu/~beebe/software/ndiff/'
  url 'ftp://ftp.math.utah.edu/pub/misc/ndiff-2.00.tar.gz'
  sha1 'b9ef2eb0de0cd26c3c92e0b3342d0ea4c37e8975'

  conflicts_with 'nmap', :because => 'both install `ndiff` binaries'

  def install
    ENV.j1
    # Install manually as the `install` make target is crufty
    system "./configure", "--prefix=.", "--mandir=."
    mkpath 'bin'
    mkpath 'man/man1'
    system "make install"
    bin.install "bin/ndiff"
    man1.install "man/man1/ndiff.1"
  end

  test do
    system "#{bin}/ndiff", "--help"
  end
end

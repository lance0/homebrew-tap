class Ttl < Formula
  desc "Modern traceroute/mtr-style TUI with hop stats and ASN/geo enrichment"
  homepage "https://github.com/lance0/ttl"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-apple-darwin.tar.gz"
      sha256 "1d265c91c736ffa4993ff66964af2b3319338a9df0e3992cf0bf3d183a1569f1"
    end
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-apple-darwin.tar.gz"
      sha256 "f86cfa55004ead172e7e46ded0813e7d9dd5b1f3ba73b5e9cad561f9f4a29957"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-unknown-linux-musl.tar.gz"
      sha256 "153c70713e9babcec3d3bc1ed9066cb7f813ef9b51040eb3bf3ccfa9e2b8f217"
    end
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6acc92198ea62b3c38ae9cce6d76053b7ca2e4b0bb440e76a96fe7a4fbec725c"
    end
  end

  def install
    bin.install "ttl"
  end

  def caveats
    <<~EOS
      ttl requires elevated privileges for raw socket access.

      On macOS:
        sudo ttl <target>

      On Linux (recommended):
        sudo setcap cap_net_raw+ep $(which ttl)
        ttl <target>
    EOS
  end

  test do
    assert_match "ttl", shell_output("#{bin}/ttl --help")
  end
end

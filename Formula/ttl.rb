class Ttl < Formula
  desc "Modern traceroute/mtr-style TUI with hop stats and ASN/geo enrichment"
  homepage "https://github.com/lance0/ttl"
  version "0.11.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-apple-darwin.tar.gz"
      sha256 "65e1a63bba11b5f3c63c29a35d8d7cd9522332c5704f5cb0f412cc2e6704f3cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "650aa2732de1d248304147f6ab64cf8476dbd531c9fe199ed6fbcb5b71bf5cd5"
    end
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8a40d9a754a4309146224fbe20fad583e387f3b8b1a5a4f536a95d4d8b90f8c"
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

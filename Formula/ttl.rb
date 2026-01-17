class Ttl < Formula
  desc "Modern traceroute/mtr-style TUI with hop stats and ASN/geo enrichment"
  homepage "https://github.com/lance0/ttl"
  version "0.12.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-apple-darwin.tar.gz"
      sha256 "82563a2b3d6aacbb787f8a1f46c062141e00e797715613c886fd07f85221ce5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c5c39b123304a83e8d7ab387acfbf26fea672361484a96749d0542f70a8edf34"
    end
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f29ef71eeca16f28b1f0502258e88bb7bb5ddcc51facba826a82c3bcd366330"
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

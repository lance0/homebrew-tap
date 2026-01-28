class Ttl < Formula
  desc "Modern traceroute/mtr-style TUI with hop stats and ASN/geo enrichment"
  homepage "https://github.com/lance0/ttl"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-apple-darwin.tar.gz"
      sha256 "d0f2cf8ac04041b3cbbe7a6a3f7e9a89058d34398f502da7741df2bc1bc5490b"
    end
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-apple-darwin.tar.gz"
      sha256 "5a5e560e6e77c346d7849cf853a3db576c3deff1e4518e945ee328841be947ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-unknown-linux-musl.tar.gz"
      sha256 "66890ed2a1517c8d8c1aaa94edf5890011c5f756e6c1d1fc23ed91c703b8bbe3"
    end
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ff659c73ee394a93cb7fdf46f41146bf454882a6a43c7a86fbbc146dcbfb31f"
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

class Ttl < Formula
  desc "Modern traceroute/mtr-style TUI with hop stats and ASN/geo enrichment"
  homepage "https://github.com/lance0/ttl"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-apple-darwin.tar.gz"
      sha256 "08368731cd1bcba25d0fa0b591cd17917c64db4718b09327fb23a845bddde431"
    end
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-apple-darwin.tar.gz"
      sha256 "c53a8aab6e0dee989996262147ce51a953fa6e66b2492856efe5e58196ca7431"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c63654f41551661763908d0f18e780bbdebd547e9b1a404e05cbb1ffb38bd160"
    end
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22f318cf9baab67bdf9bf0360f3ae30732b1b4bb354c72f7f01613f0b9583ab8"
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

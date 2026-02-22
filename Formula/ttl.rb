class Ttl < Formula
  desc "Modern traceroute/mtr-style TUI with hop stats and ASN/geo enrichment"
  homepage "https://github.com/lance0/ttl"
  version "0.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-apple-darwin.tar.gz"
      sha256 "7b2562454734cd139b7efd69798a0c9c6b3c3b822d3ff450fc7a194f6b9e8611"
    end
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-apple-darwin.tar.gz"
      sha256 "798e3c6e501e241a3edc9ed260579b25f209f1fcc5c84bbd3fe19ed5a3507f1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eb462af61175a14077c55b99d36c4bf7d28f594ec28b82f7890511fc97c3b186"
    end
    on_arm do
      url "https://github.com/lance0/ttl/releases/download/v#{version}/ttl-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a670b4725d555c82aa34408dc00ea8b9213a8b121998595d239d9bbe95cf5e4"
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

class Xfr < Formula
  desc "Modern network bandwidth testing with TUI - iperf3 replacement"
  homepage "https://github.com/lance0/xfr"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-apple-darwin.tar.gz"
      sha256 "aaa0f149fe11fa94986aaa5358e3736a643f504a8d78c4db53dfecdc6b5dcb6c"
    end
    on_intel do
      # No pre-built binary for Intel Mac - install from crate
      odie "Intel Mac: please install via cargo: cargo install xfr"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a83baa2a7d7de3fe52bc8f816de0c445fb7699a83c4f776df5b39e50663b9e62"
    end
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f5343596ff5bb49b6e42c95bc4c48efeb16ad1c4940208c71d5c6564b28b07f"
    end
  end

  def install
    bin.install "xfr"
  end

  test do
    assert_match "xfr", shell_output("#{bin}/xfr --help")
  end
end

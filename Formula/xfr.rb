class Xfr < Formula
  desc "Modern network bandwidth testing with TUI - iperf3 replacement"
  homepage "https://github.com/lance0/xfr"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      # No pre-built binary for Intel Mac - install from crate
      odie "Intel Mac: please install via cargo: cargo install xfr"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "xfr"
  end

  test do
    assert_match "xfr", shell_output("#{bin}/xfr --help")
  end
end

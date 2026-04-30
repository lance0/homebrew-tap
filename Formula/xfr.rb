class Xfr < Formula
  desc "Modern network bandwidth testing with TUI - iperf3 replacement"
  homepage "https://github.com/lance0/xfr"
  version "0.9.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-apple-darwin.tar.gz"
      sha256 "b434e1b8c77bdb3d78d746c1e88d6a6a8ed0105e9a979b3f40bb4ebdd4a69db0"
    end
    on_intel do
      # No pre-built binary for Intel Mac - install from crate
      odie "Intel Mac: please install via cargo: cargo install xfr"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "160e96d37eed9366a20d6e75ca3e9319b75285408f31757934bb88b7d22ebde8"
    end
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33dcd905b96144c5f343a5944bc201c323e4c5f5d9ffad9c8011158affc2d233"
    end
  end

  def install
    bin.install "xfr"
  end

  test do
    assert_match "xfr", shell_output("#{bin}/xfr --help")
  end
end

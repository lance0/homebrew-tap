class Xfr < Formula
  desc "Modern network bandwidth testing with TUI - iperf3 replacement"
  homepage "https://github.com/lance0/xfr"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-apple-darwin.tar.gz"
      sha256 "679e1cb3c7e8749211c2d5cbfe2e4c51a8b7df57bed7f446949ac1009a8d1304"
    end
    on_intel do
      # No pre-built binary for Intel Mac - install from crate
      odie "Intel Mac: please install via cargo: cargo install xfr"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fc27cad619886142d0fb5ad52d36cad3faa262545ee99c23751f5a325f0accfe"
    end
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c33c452d835b52fb6982ccf509e8e7966a875baecf3efc2b29c447c0f77055a"
    end
  end

  def install
    bin.install "xfr"
  end

  test do
    assert_match "xfr", shell_output("#{bin}/xfr --help")
  end
end

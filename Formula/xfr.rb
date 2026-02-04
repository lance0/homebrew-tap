class Xfr < Formula
  desc "Modern network bandwidth testing with TUI - iperf3 replacement"
  homepage "https://github.com/lance0/xfr"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-apple-darwin.tar.gz"
      sha256 "69d0caeb13d04c2486e75e3be9fc5bee2d92181a82a22415f7a9d55935f02bb5"
    end
    on_intel do
      # No pre-built binary for Intel Mac - install from crate
      odie "Intel Mac: please install via cargo: cargo install xfr"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6dbe2fc3fe354ac0914074d16e17706a85423306f9e270239173b96b622366f6"
    end
    on_arm do
      url "https://github.com/lance0/xfr/releases/download/v#{version}/xfr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88c4a62d1ef708bd1b64da12a8fc4542f97758a16ebc7b8b7688f2b189f5a248"
    end
  end

  def install
    bin.install "xfr"
  end

  test do
    assert_match "xfr", shell_output("#{bin}/xfr --help")
  end
end

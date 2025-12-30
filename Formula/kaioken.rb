# Homebrew formula for kaioken
# To install: brew tap lance0/kaioken && brew install kaioken
# Or: brew install lance0/kaioken/kaioken

class Kaioken < Formula
  desc "High-performance HTTP load testing tool with real-time TUI"
  homepage "https://github.com/lance0/kaioken"
  version "1.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lance0/kaioken/releases/download/v#{version}/kaioken-macos-aarch64.tar.gz"
      sha256 "d3f906745d76b29e12d8de197742626e9ea0b18c4261ab7dd0b737431e6390b0"
    else
      url "https://github.com/lance0/kaioken/releases/download/v#{version}/kaioken-macos-x86_64.tar.gz"
      sha256 "9d08cecfb2cc68f969e3039049a5327723a125e9522cda8a991a63089fa9f952"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lance0/kaioken/releases/download/v#{version}/kaioken-linux-aarch64.tar.gz"
      sha256 "7a9ae5c3ee33ccf254f6879e63bbea16d24cd02972dde1119782e1c68ffb83f9"
    else
      url "https://github.com/lance0/kaioken/releases/download/v#{version}/kaioken-linux-x86_64.tar.gz"
      sha256 "fb8a072b8b2f571c748cc7b04b049a82b5bccc6c54f26f25dd32c32fa338be90"
    end
  end

  def install
    bin.install "kaioken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kaioken --version")
  end
end

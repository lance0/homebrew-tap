class Ahab < Formula
  desc "Interactive Docker cleanup TUI - hunt down and harpoon unused resources"
  homepage "https://github.com/lance0/ahab"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-macos-x86_64.tar.gz"
      sha256 "bfd46fad1964b320d12f7e02f557349185e57276bae199b973f32701f94928c1"
    end
    on_arm do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-macos-aarch64.tar.gz"
      sha256 "898274d31c18953fd7658f786b3ab4918b7e4cfed31f7d069f07013c1b556b2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-linux-x86_64.tar.gz"
      sha256 "b2e16e7e1db6567328945794c31f3ab3c662c7b633dbc45382a1a8f8468170d1"
    end
    on_arm do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-linux-aarch64.tar.gz"
      sha256 "f40c8330f98271ae5bf634b9c02ad3578330c66af91d23982d88fa588ec7b6c0"
    end
  end

  def install
    bin.install "ahab"
  end

  test do
    assert_match "ahab", shell_output("#{bin}/ahab --help")
  end
end

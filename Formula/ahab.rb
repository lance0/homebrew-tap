class Ahab < Formula
  desc "Interactive Docker cleanup TUI - hunt down and harpoon unused resources"
  homepage "https://github.com/lance0/ahab"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-macos-x86_64.tar.gz"
      sha256 "97706d24c1a8216dabcfcf0463d9dfce245ebb072750b046223aa92ac4c14daf"
    end
    on_arm do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-macos-aarch64.tar.gz"
      sha256 "c41b031f001ad409bd992771681f4f83384fd5daccd0fb75de7cb0f18263e0d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-linux-x86_64.tar.gz"
      sha256 "8104d30d22abc579a2f44b2c17b1364c59cec3dfbf2ad1087d98bad3ff346bbc"
    end
    on_arm do
      url "https://github.com/lance0/ahab/releases/download/v#{version}/ahab-linux-aarch64.tar.gz"
      sha256 "2bdd64849d37626cc059a8f9d6bc8c38625c780a46fa09b9fd8cb63bea817096"
    end
  end

  def install
    bin.install "ahab"
  end

  test do
    assert_match "ahab", shell_output("#{bin}/ahab --help")
  end
end

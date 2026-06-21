# nbox — Terminal UI, CLI, and MCP server for NetBox. https://github.com/lance0/nbox
# Linux uses the static musl archives; macOS uses the darwin archives.
# Updated per release from the GitHub Release's SHA256SUMS.
class Nbox < Formula
  desc "Terminal UI and CLI for NetBox"
  homepage "https://github.com/lance0/nbox"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-apple-darwin.tar.gz"
      sha256 "abd150d83754a26bfdafb2e424007bfe12a5de0281bc014b491d1e40f27f6306"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-apple-darwin.tar.gz"
      sha256 "225a4e24a0c7f195bff326e947056f373ae8478c7b3b5b15554370c039f19440"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a337190443e07631417cc6a9e94d11ed63c5dadc5701a703c61a4fa3e4205255"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-unknown-linux-musl.tar.gz"
      sha256 "434b385c2d644fdbef7dfaf772bf810e07008d26137c8a4a958bfabf3f5264d0"
    end
  end

  def install
    bin.install "nbox"
    # Generate and install shell completions from the binary.
    generate_completions_from_executable(bin/"nbox", "completions")
  end

  test do
    assert_match "nbox #{version}", shell_output("#{bin}/nbox --version")
  end
end

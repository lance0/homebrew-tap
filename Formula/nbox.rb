# nbox — Terminal UI, CLI, and MCP server for NetBox. https://github.com/lance0/nbox
# Linux uses the static musl archives; macOS uses the darwin archives.
# Updated per release from the GitHub Release's SHA256SUMS.
class Nbox < Formula
  desc "Terminal UI and CLI for NetBox"
  homepage "https://github.com/lance0/nbox"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-apple-darwin.tar.gz"
      sha256 "17c058ebfe7123cb6ec2bfcc54a7f936373952412f5fa8b66fe849ce7d78c16a"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-apple-darwin.tar.gz"
      sha256 "74bb76266825fd2ef1a939cb4b8ce9c9b81697565b4041ac23f3e0a6edc70ecc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d1b3d481b370b32798afb87367a78c15552707d6c2073a7bd5db788f9689786"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d8bfc986e43aca53a4cd5361801029efa9c3479b5efa26f474b9f5f9afb9da6"
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

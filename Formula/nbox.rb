# nbox — Terminal UI, CLI, and MCP server for NetBox. https://github.com/lance0/nbox
# Linux uses the static musl archives; macOS uses the darwin archives.
# Updated per release from the GitHub Release's SHA256SUMS.
class Nbox < Formula
  desc "Terminal UI and CLI for NetBox"
  homepage "https://github.com/lance0/nbox"
  version "0.8.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-apple-darwin.tar.gz"
      sha256 "b2203772aa688edca393308ba9399736c551c509354551324954f4248dd79e57"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-apple-darwin.tar.gz"
      sha256 "07a5497445e15d063d3e57443310e6ab0cd140b02c06a0d3794e47c1b8cc6b8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2f6dc30b7c344b60103aaee6bbb7eb8ed92126326ec6d7919501ecd6814ac71a"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3eee11ea6c23bd20f1234fef2cea7613b08d30803de9ac4bd59ab08ea77f5dfe"
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

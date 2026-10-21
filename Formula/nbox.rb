# nbox — Terminal UI, CLI, and MCP server for NetBox. https://github.com/lance0/nbox
# Linux uses the static musl archives; macOS uses the darwin archives.
# Updated per release from the GitHub Release's SHA256SUMS.
class Nbox < Formula
  desc "Terminal UI and CLI for NetBox"
  homepage "https://github.com/lance0/nbox"
  version "0.15.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-apple-darwin.tar.gz"
      sha256 "8cd32444b4afb17aef212146234bff6511cf68862b1fbc1296e2bb6f49b6d8c9"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-apple-darwin.tar.gz"
      sha256 "88fec9d2f6aa9ef42cbf7d7f05fd3994bbbef6c018eb5b05afd97b3d26b673f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9eaa6c5c336088b4a144a28fd56aec731d418a21a5d42c965cbe933e3b27735f"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a95edbd8516ecba3d56826df91f6bf7905d69b0131fb3f5594c40929fb5eb75a"
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

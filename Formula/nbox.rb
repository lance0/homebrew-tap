# nbox — Terminal UI, CLI, and MCP server for NetBox. https://github.com/lance0/nbox
# Linux uses the static musl archives; macOS uses the darwin archives.
# Updated per release from the GitHub Release's SHA256SUMS.
class Nbox < Formula
  desc "Terminal UI and CLI for NetBox"
  homepage "https://github.com/lance0/nbox"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-apple-darwin.tar.gz"
      sha256 "5f693c798f1eedc908f65ea622971775752857674da539fcb87fb900754b6b6e"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-apple-darwin.tar.gz"
      sha256 "e87f20a85a1a9bfd7d572ff8dca65f5f950d9f72568eeac45112a5cbc3302edf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cb14353ecca251be706d01ef70d89243647b8a9220bd7054cfcb7f05791047c6"
    end
    on_intel do
      url "https://github.com/lance0/nbox/releases/download/v#{version}/nbox-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bc3517612a735fe8ec6092b4f9dcce5dcd37c8175d9cc276402d23fab759f46c"
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

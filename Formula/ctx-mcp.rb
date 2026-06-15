class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.3/context-engine-rs-0.0.3.tar.gz"
  version "0.0.3"
  sha256 "0a3363e84663ee61245f09b2f609248077d664e1256bbdfe6a5ed6aa3fcdd3b2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.3/ctx-mcp-0.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "e3c8451ba89ebdbf56e49dea0affd7443cc5e0ab244baeb2a05d3bb500fdbe90"
    end
    on_intel do
      depends_on "rust" => :build
    end
  end

  on_linux do
    depends_on "rust" => :build
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ctx-mcp"
    else
      system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
    end
  end

  test do
    assert_match "ctx-mcp 0.0.3", shell_output("#{bin}/ctx-mcp --version")
  end
end

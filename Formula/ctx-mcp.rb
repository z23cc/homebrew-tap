class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.2/context-engine-rs-0.0.2.tar.gz"
  version "0.0.2"
  sha256 "6d054407a72cdfe90e2538178c6661897aec4082123e26798241a94426b3609c"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.2/ctx-mcp-0.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "df3f0b8b5a91c0badd40520efb5909efbdcb273df6476b6484a17139ed66e2da"
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
    assert_match "ctx-mcp 0.0.2", shell_output("#{bin}/ctx-mcp --version")
  end
end

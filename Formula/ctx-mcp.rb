class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.27/context-engine-rs-0.0.27.tar.gz"
  sha256 "f9043e7e4fb3cf1750f5dd4f6e1a45b25e46679acd50bf8d887c6caac61daee4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.27"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "6d6441527e5023fdab97f7f3de183c7460d3d8f445d18ae561383edd1180dff2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.27", shell_output("#{bin}/ctx-mcp --version")
  end
end

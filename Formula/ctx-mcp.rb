class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.15/context-engine-rs-0.0.15.tar.gz"
  sha256 "a98a1356b4a5ad81fe80f90c215e9f57f9ee6e79f036a75f3e4cb0a5594cfde1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.15"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "ab9e15a7cf0c3195559bfae6cfc1fc7ba81824702d9bd0f7d1aa581578635f6b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.15", shell_output("#{bin}/ctx-mcp --version")
  end
end

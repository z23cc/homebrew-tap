class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.14/context-engine-rs-0.0.14.tar.gz"
  sha256 "1d813c3e12fdbf5a38cafa8e9c192f95c0f9575036214478b218780a2a9ded82"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.14"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "2a2ea60ddf7313dfb7b958d588eccc88c4ca0468a9c1958ca9292e1b0c97523e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.14", shell_output("#{bin}/ctx-mcp --version")
  end
end

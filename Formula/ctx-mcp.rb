class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.26/context-engine-rs-0.0.26.tar.gz"
  sha256 "3ea31034938c96247544903fa6cac8321669b316c9ee17fb6d808d5cb58d6096"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.26"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "5f2b607f4346ed63cab29c729ca2d8f7ba2ed4ee6d70c1227a4d2a9747c34561"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.26", shell_output("#{bin}/ctx-mcp --version")
  end
end

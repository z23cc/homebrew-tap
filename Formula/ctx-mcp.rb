class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.9/context-engine-rs-0.0.9.tar.gz"
  sha256 "6359e65945dc5256cd6b284c43710996a30c47f766034ffdd0f0bba8e19ece9d"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.9"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b006aa790d4e6629cc22abc83c0e9fd905bb1722babb5817f2dedd0c15e1932f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.9", shell_output("#{bin}/ctx-mcp --version")
  end
end

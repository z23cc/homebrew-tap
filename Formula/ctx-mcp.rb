class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.24/context-engine-rs-0.0.24.tar.gz"
  sha256 "c93fb3371cac485e1625226c66902677599d7c902b09cc235797e9c9f17297d1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.24"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "288db28f3fe8e1355db1f40eab5df0208fe5a7b6c1f73db63748e684efc0ee27"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.24", shell_output("#{bin}/ctx-mcp --version")
  end
end

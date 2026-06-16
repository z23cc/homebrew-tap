class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.25/context-engine-rs-0.0.25.tar.gz"
  sha256 "4eb009e08603c12ed476fe9c8ab498e6a3ae3881c5fa8d971340a077acba86f3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.25"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "e9f13e5b0c4d308c302cb038ac0c91022e8e23bebbdccca22d23a51a97fe7963"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.25", shell_output("#{bin}/ctx-mcp --version")
  end
end

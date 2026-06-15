class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.4/context-engine-rs-0.0.4.tar.gz"
  sha256 "7d5a49bea0f8bf506a067e3e8f8828dfa7d6800add7e2c3d31f7483c04aabee3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.4"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "211db2eb00c804294292cb740b9ae880eefa3e7fc01d753155c11c06141fe9f3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.4", shell_output("#{bin}/ctx-mcp --version")
  end
end

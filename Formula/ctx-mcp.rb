class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.30/context-engine-rs-0.0.30.tar.gz"
  sha256 "d77164d30b6dda4bbf1a3857e01bc94ec15a5d815e4c861656358abf20c5c395"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.30"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "5eca1f897ac9a13d0c5f29d2a4092e9827c12f523a846f77815f51e0246e7c42"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.30", shell_output("#{bin}/ctx-mcp --version")
  end
end

class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.5/context-engine-rs-0.0.5.tar.gz"
  sha256 "c4c364ad486999e95b7a020c13c0468491aae771d28424e687ed9b6ade0d0b96"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "13449ca69ad57764e13591c64357f8ead5b0ea4dbbfe01f186469199e5c0c53a"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "af8264eae098b0b802a704790a0388c53822a7210c557dbe3b78492436d0e314"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.5", shell_output("#{bin}/ctx-mcp --version")
  end
end

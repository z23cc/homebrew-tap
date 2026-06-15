class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.7/context-engine-rs-0.0.7.tar.gz"
  sha256 "a5f31fb38e66c49cddedc3fe89909670ab86a6ec98b497deeae1dd3b90b6e9b4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "106a56c624515980e272ceaec0c49391c0d03fe5546338a2853014e70f07a8e1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.7", shell_output("#{bin}/ctx-mcp --version")
  end
end

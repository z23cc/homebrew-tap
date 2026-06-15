class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.6/context-engine-rs-0.0.6.tar.gz"
  sha256 "3938e7d3a0591aef585df4c7b9593e648f65624af85e37b94859eda500d99fdf"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.6"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b8810e0875e0b158bba23042631b5dbe1b6023500dd805b85304eaf5bb9dcf3a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.6", shell_output("#{bin}/ctx-mcp --version")
  end
end

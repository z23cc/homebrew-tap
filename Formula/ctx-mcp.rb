class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.23/context-engine-rs-0.0.23.tar.gz"
  sha256 "5b6a32d53e7155f7382f5bb4e3425fd81457d934d229666a0ffb17acd7888789"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.23"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "2a8716142d4047dfbadd33144631da372b389749490877eda2eb78de5cfefff9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.23", shell_output("#{bin}/ctx-mcp --version")
  end
end

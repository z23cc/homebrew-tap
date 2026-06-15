class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.17/context-engine-rs-0.0.17.tar.gz"
  sha256 "5f1174adc86b276b911dc6d3dc41bf5484f81de7c98382cf2d2de0192e5b5d24"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.17"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "7e015fc9fd4b65abffe2092cd1e71996e606c74deda80c18b4005dbfe505e90c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.17", shell_output("#{bin}/ctx-mcp --version")
  end
end

class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.8/context-engine-rs-0.0.8.tar.gz"
  sha256 "400826401fa5307c4adf570d374a7298724b70a688fe97e237e0b5da4ea1158f"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.8"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "5d2bb6d427add093b0263e7d0826dc93e9f827a78a730dd7eeee30928c4242bb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.8", shell_output("#{bin}/ctx-mcp --version")
  end
end

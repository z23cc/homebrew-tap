class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.22/context-engine-rs-0.0.22.tar.gz"
  sha256 "79f6e0876f7b71ff3051bc092a6f1898d8dcbaaef024884985809c768774356d"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.22"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "8fd4202293bf902f30876ffad95542279010096f33f3fbe6da69fc4ba9a04c3b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.22", shell_output("#{bin}/ctx-mcp --version")
  end
end

class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.10/context-engine-rs-0.0.10.tar.gz"
  sha256 "a08a189f2ad8d562a54e3020d93a789acefe8ecb6717b0b2e5175f3f4a8b66b2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.10"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "1509d1aefc430b3978ebf3380ed6de012105541a789237ac4f96e85e8e48a727"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.10", shell_output("#{bin}/ctx-mcp --version")
  end
end

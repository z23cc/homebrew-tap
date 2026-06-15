class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.13/context-engine-rs-0.0.13.tar.gz"
  sha256 "b5fe5213c877a4567b0f9b21c63bbd7059d74a64d0fa3ce0467c7440c71e76b0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.13"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "02ec12518f9bc83f747a6cba8655e1621a9723b5fc474959f77fe8698b9b1dd4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.13", shell_output("#{bin}/ctx-mcp --version")
  end
end

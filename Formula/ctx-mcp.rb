class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.12/context-engine-rs-0.0.12.tar.gz"
  sha256 "bcfe6c7f1f5110231c93d8e3fc9d8ab7ddfd2c83b34ec8b0f76e3b767fe198ba"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.12"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "d571d8b5488f3d6ae0e0cb8b1b73307ebbff9cf433c0e8a29adba14e86a494a3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.12", shell_output("#{bin}/ctx-mcp --version")
  end
end

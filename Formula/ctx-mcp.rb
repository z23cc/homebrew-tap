class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.18/context-engine-rs-0.0.18.tar.gz"
  sha256 "53d102190caaf9e66ae3e347768f8467556a2f8858b8353c9005ac0719ca0168"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.18"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "be67e78f31076051f57e1579ddb87bf0809d6eb427898a9f2390af14ae5b7d5f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.18", shell_output("#{bin}/ctx-mcp --version")
  end
end

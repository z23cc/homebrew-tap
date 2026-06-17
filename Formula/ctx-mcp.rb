class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.29/context-engine-rs-0.0.29.tar.gz"
  sha256 "eb37ccdb881058ff75fd5a5ea4b7374ac31388c09c81ce43922e70a9448812b0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.29"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "38af5284b302bf10e7e30f670545f70e61222bcfbcb606607bbc2972ac540c44"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.29", shell_output("#{bin}/ctx-mcp --version")
  end
end

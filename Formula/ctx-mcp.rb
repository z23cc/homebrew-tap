class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.28/context-engine-rs-0.0.28.tar.gz"
  sha256 "01a31cd66eb44d5fea6d8649bc4059cc70507426f37038450d2852bc66855cb0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.28"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "652e780f27d3763896a3a47668f20c11bcdaa1ea9bf589d384aaaad1556ebc35"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.28", shell_output("#{bin}/ctx-mcp --version")
  end
end

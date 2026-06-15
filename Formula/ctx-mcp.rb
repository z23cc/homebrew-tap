class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.1/context-engine-rs-0.0.1.tar.gz"
  version "0.0.1"
  sha256 "e55cad1e4850c4c76580b2e1a608ab7409195134aac1e14c78b4d61a82176c2b"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/z23cc/context-engine-rs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.1", shell_output("#{bin}/ctx-mcp --version")
  end
end

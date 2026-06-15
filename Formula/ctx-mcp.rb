class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.3/context-engine-rs-0.0.3.tar.gz"
  version "0.0.3"
  sha256 "0a3363e84663ee61245f09b2f609248077d664e1256bbdfe6a5ed6aa3fcdd3b2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "49da1dbaa90efe9427f4d2d22fd97356bca710da63bdbcfcd60356ec81f20616"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp #{version}", shell_output("#{bin}/ctx-mcp --version")
  end
end

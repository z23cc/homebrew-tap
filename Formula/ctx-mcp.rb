class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.16/context-engine-rs-0.0.16.tar.gz"
  sha256 "bccfdc7ab4b4beadf83311440461c6583f167e00321bce94d9f26ddd79ad905b"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.16"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "0791f4ce534864621f0d2fa96671d095c07b225589f2b0e0cf31b43a84ef5454"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.16", shell_output("#{bin}/ctx-mcp --version")
  end
end

class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.21/context-engine-rs-0.0.21.tar.gz"
  sha256 "606b2cc14a34dcff9a6044e8edb6fb2309e2acf314514a93448f5ba3021e134f"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.21"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "3a6e142d6aff2dc9cb4d7e5b8a0b984c98f5477ff3f0944acba02d0b68c04fd9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.21", shell_output("#{bin}/ctx-mcp --version")
  end
end

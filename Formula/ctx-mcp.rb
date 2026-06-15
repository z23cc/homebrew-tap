class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.11/context-engine-rs-0.0.11.tar.gz"
  sha256 "ee5e086425c18b2aa87897fb772be9465b73336823317147b0f7ba677bc7f00b"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.11"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "db910367f0acc0e4e54e96d2b87683e1bde528012b40ba3d6ff573e9182a3ae3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.11", shell_output("#{bin}/ctx-mcp --version")
  end
end

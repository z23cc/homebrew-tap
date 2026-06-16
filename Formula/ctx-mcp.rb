class CtxMcp < Formula
  desc "Minimal snapshot-centered context engine (MCP server over stdio)"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.20/context-engine-rs-0.0.20.tar.gz"
  sha256 "941d19eea6ea288c845bc5ce71796feafe2afa351abf69dd7a1d58ff6f90657f"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.20"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "bd73b9d650b519efb4ac7f8bcb674f22a01b9ad979b03a032709debed36da0e2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/ctx-mcp")
  end

  test do
    assert_match "ctx-mcp 0.0.20", shell_output("#{bin}/ctx-mcp --version")
  end
end

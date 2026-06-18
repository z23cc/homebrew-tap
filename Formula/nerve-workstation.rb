class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.32/nerve-workstation-0.0.32.tar.gz"
  sha256 "f0d53795927a3c2799427642d973914a52417fe85f1c10ee1f88bdaf3d9a6a2a"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.32"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "2ea99644ae3592ee2f66004c861d0a607c9d1f8ac3e6c8f8781abe21fb319b33"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.32", shell_output("#{bin}/nerve --version")
  end
end

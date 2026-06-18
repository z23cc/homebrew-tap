class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.35/nerve-workstation-0.0.35.tar.gz"
  sha256 "b295018bb839746e2a119223203fc782beef264a9a490db8117c5bf442ac4860"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.35"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "263b547649a2992881b34426bff6d1e396c22817d0309c95a7ef2f2d0602cb4f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.35", shell_output("#{bin}/nerve --version")
  end
end

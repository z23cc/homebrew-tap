class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.43/nerve-workstation-0.0.43.tar.gz"
  sha256 "409f446f8a5aa700386e565cdcf4bf2b7964986668e90ebdc728aa15023108d9"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.43"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "8a48fab762593a4811d3c2dcc4529ed6a0ac2adb29a982757fcdbca7791bed50"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.43", shell_output("#{bin}/nerve --version")
  end
end

class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.37/nerve-workstation-0.0.37.tar.gz"
  sha256 "753955bebd0e022d24129f4589ef6929cbb2a76b7766aa0b5e87b87ea4f701db"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.37"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "9e3f83de7a1765c434557ba1e5ee3c0f5c5cc1b5ea091bf26b578cc1661b2a64"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.37", shell_output("#{bin}/nerve --version")
  end
end

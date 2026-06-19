class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.49/nerve-workstation-0.0.49.tar.gz"
  sha256 "c27b199318262f3c013ef644472b6e60a51229ad9f57ef80935664d5f6cd00f1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.49"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "726a3bdecf9222fec35cbf6d71f2a3969f40642a41f066ead89d4c8e660c19aa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.49", shell_output("#{bin}/nerve --version")
  end
end

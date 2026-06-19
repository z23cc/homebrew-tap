class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.50/nerve-workstation-0.0.50.tar.gz"
  sha256 "e3c9c9e2f66beb96fc1a2823d1875082bdf94273cc654ea2a6d7c9034f69c1bf"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.50"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "4df403371669d577eab5dd0d7f9e1ae525a45c094104926e1d5a83f8137c4475"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.50", shell_output("#{bin}/nerve --version")
  end
end

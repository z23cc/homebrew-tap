class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.60/nerve-workstation-0.0.60.tar.gz"
  sha256 "dc335d660fd50a829fe6de862aba1a6d84bb508758c7598bc91878e22857aa49"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.60"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "64e82e72d53452002f3bc0264b0d3a5c3b79b01ce2aff929c1314a5ad2eae80e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.60", shell_output("#{bin}/nerve --version")
  end
end

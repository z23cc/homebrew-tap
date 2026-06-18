class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.36/nerve-workstation-0.0.36.tar.gz"
  sha256 "2cae74f8f69a123542cf2f9e2d58c4b67e556098b77a1b20f7373afe7aa7ea61"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.36"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b1fb72dd287f8e9287d6ed12f6488ea1ea5cd6260d06467d63f28e3462a30145"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.36", shell_output("#{bin}/nerve --version")
  end
end

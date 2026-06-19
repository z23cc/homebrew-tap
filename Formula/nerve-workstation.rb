class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.45/nerve-workstation-0.0.45.tar.gz"
  sha256 "6b7977f6a12952e79094876839a4d556ede8cb3218bc0f7a580c7153a4a53ff1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.45"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "c0c873a668f6b9d12ab01315e1b50afde6ec18408e7bea2c03083af95ab30e4e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.45", shell_output("#{bin}/nerve --version")
  end
end

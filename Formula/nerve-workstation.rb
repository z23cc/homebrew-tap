class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.39/nerve-workstation-0.0.39.tar.gz"
  sha256 "487cdea06ecbe2ad53d8bcd407016566b3cd8cf629e737aa78eb15f633dfbe50"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.39"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "fdff20f38573bce569faa764d7e202a36a82e9523d3f74ec9d62267dc570cfbc"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.39", shell_output("#{bin}/nerve --version")
  end
end

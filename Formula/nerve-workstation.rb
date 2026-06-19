class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.47/nerve-workstation-0.0.47.tar.gz"
  sha256 "b049ee2b03edaceb463923daff182a285efca10c399fdccb3456d436c496ab54"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.47"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "733b7b96eb572bf4dd36aed9518ed7979fe437ba2c7f1abf61ee3261578e7e1a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.47", shell_output("#{bin}/nerve --version")
  end
end

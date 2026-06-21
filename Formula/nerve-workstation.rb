class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.59/nerve-workstation-0.0.59.tar.gz"
  sha256 "baa780dca4ca7565e3cb8749b305edc10e133e92777d08a2ed95bf52a14e2f37"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.59"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "bb2dc47735d939a449f0b76b3f0f62abb144260081457320f8bd8b4f6f02b0ba"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.59", shell_output("#{bin}/nerve --version")
  end
end

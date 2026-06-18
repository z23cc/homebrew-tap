class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.33/nerve-workstation-0.0.33.tar.gz"
  sha256 "2dcf35ede595741f7f48584f8088b74f6821e4a31f35d03b7e5b7c55084d5d1b"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.33"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b9bb57e550264554fd8fb730258a8fc83abb913ad18a2a3f070a866225fa9283"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.33", shell_output("#{bin}/nerve --version")
  end
end

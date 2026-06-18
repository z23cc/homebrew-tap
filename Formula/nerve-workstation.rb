class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.40/nerve-workstation-0.0.40.tar.gz"
  sha256 "08a6ed6a8e12226328e7d0333f121c44d0174784d6b818d8f86bbdda479ecba3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.40"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "c952ff550e7e50e3aa7d963f9d128fb0ebed2b9f9f3748981c99451a9ce94ff2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.40", shell_output("#{bin}/nerve --version")
  end
end

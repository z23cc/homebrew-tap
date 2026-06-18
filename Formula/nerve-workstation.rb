class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.38/nerve-workstation-0.0.38.tar.gz"
  sha256 "89d7256dd6c91ce3b99649b89ee6f52df0c9fa2e43463bb11502f08ea860d883"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.38"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "6aa2f8ecaf856c1133a815178708e2a8e827a7f88458bc0d7a4db9fc848cd8f9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.38", shell_output("#{bin}/nerve --version")
  end
end

class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.53/nerve-workstation-0.0.53.tar.gz"
  sha256 "7cbe4b4be931f196a6cf19aed2dfd13665b50e4f4690735488a2d604ed1e8a05"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.53"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "04ca93f33f56d0ab90b59bbab23c52a307c5541029962e958db31052cfd22f81"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.53", shell_output("#{bin}/nerve --version")
  end
end

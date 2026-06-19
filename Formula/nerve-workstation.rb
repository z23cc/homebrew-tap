class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.52/nerve-workstation-0.0.52.tar.gz"
  sha256 "53c71c2060183cd1061d4cfad78c655051e367e5c50f8c60222eb60d33636de1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.52"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "29b862795e7085f23994ddc41a832501437b9533eb2f27a58f6a4f74d51bfc21"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.52", shell_output("#{bin}/nerve --version")
  end
end

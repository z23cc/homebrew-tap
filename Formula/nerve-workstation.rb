class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.54/nerve-workstation-0.0.54.tar.gz"
  sha256 "ae5f1b0616cab2f14533a910b10d14ab42636f9b838a08e8956495dc90c1069b"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.54"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "7f9ec585005c6003a45b8d6ba0a0ee9247f2e93889de4d6ebcc2f6fecf5a5e28"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.54", shell_output("#{bin}/nerve --version")
  end
end

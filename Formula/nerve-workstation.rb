class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.46/nerve-workstation-0.0.46.tar.gz"
  sha256 "2cbafd34db4f5f07795a2b68c54d534658e069a46875888a819a80d23cf905c9"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.46"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "cd230d105d08bd4be595da9131bb4b0542ec1884715c0754cdd69713f6609ece"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.46", shell_output("#{bin}/nerve --version")
  end
end

class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.41/nerve-workstation-0.0.41.tar.gz"
  sha256 "247f752fde996fe25412e657767252005f73f4f35b28b0bdc201b5b03e57eb68"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.41"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b2abb95d14ccaca746466e7cac99d2e90da7a927350b06db14ca71779e5b893a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.41", shell_output("#{bin}/nerve --version")
  end
end

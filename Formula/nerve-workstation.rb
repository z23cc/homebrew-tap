class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.44/nerve-workstation-0.0.44.tar.gz"
  sha256 "b07cf4deae04eb9f390696719d9e32a0ed23c610c2037e427373bab3bfa84dc7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.44"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "154b8334f9bf171e0dcf81b6e5ccaeb3202619e39e62bf62002590502a04023c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.44", shell_output("#{bin}/nerve --version")
  end
end

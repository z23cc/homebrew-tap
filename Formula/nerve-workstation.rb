class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.48/nerve-workstation-0.0.48.tar.gz"
  sha256 "894b4580cfda7fbe156462df9dcc2c6c4eede135c9e45a18d087346448fd5bf8"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.48"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "5aa75b7d893bc10a55b274c3d92746ee6f43efc8c13b408ae39f6304e9fd6225"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.48", shell_output("#{bin}/nerve --version")
  end
end

class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.42/nerve-workstation-0.0.42.tar.gz"
  sha256 "b927fbd8df4859f1e5879758b4f363b9cc66d92e4f7c04763fa40f316684811a"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.42"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "ff9df0995616d946253f75be497b7f39ca03a6d2ebd417e06964d06ffc1507e7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.42", shell_output("#{bin}/nerve --version")
  end
end

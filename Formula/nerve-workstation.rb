class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.62/nerve-workstation-0.0.62.tar.gz"
  sha256 "47822c06f7da22bc185880b5461f4a4c819eed244a41ee7deea4ef94d0dd01e5"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.62"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b13cfce4299074b50d771b82f5dace9f3631befd28847f0d4dab63bda0e63605"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.62", shell_output("#{bin}/nerve --version")
  end
end

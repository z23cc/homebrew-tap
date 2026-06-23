class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.65/nerve-workstation-0.0.65.tar.gz"
  sha256 "2e6947692f7dd1724848c16230a7802dd98d84dd5fdf402797adb5e42ac95ab7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.65"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b793ff7c63a0202850c8d04cc238379c3f0082258d34cb7f4657d91e83fc2255"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.65", shell_output("#{bin}/nerve --version")
  end
end

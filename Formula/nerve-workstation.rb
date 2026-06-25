class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.73/nerve-workstation-0.0.73.tar.gz"
  sha256 "1be675ed7d82fa3ad5470fab233e12daf9279fe829c3c1b073f20a61c155836a"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.73"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "313f44ea57c0890d2bf2c682be456ecf386bb06b779a1c41b5dbc5bb86cab47d"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.73", shell_output("#{bin}/nerve --version")
  end
end

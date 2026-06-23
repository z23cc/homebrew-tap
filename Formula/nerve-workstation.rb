class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.66/nerve-workstation-0.0.66.tar.gz"
  sha256 "7a68bf270e16bee3cea3790a6a796283099214eb398434f0c1dfddeaf13b31ed"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.66"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "b074082f9d12a6e6f92e42a5f048feb06023a67f3e38d5dfd3c451f7d3ea8a01"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.66", shell_output("#{bin}/nerve --version")
  end
end

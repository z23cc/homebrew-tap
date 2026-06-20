class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.57/nerve-workstation-0.0.57.tar.gz"
  sha256 "b90b631098d82c6c536a9f57a6cad214803d4d67f1a4ee50f97a1e76b419ddb7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.57"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "e335578195677194272f6db8041ff75f53beeaafdb39c19017bb4064604f5f9f"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so `nerve chat` works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.57", shell_output("#{bin}/nerve --version")
  end
end

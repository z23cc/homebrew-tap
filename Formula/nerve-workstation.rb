class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.67/nerve-workstation-0.0.67.tar.gz"
  sha256 "99e50aee5d83b0503010c669221f1e8c8d8a07fa305b6e752e123946106318c1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.67"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "ab33112e2c938ac6c2f81ded46bc3183618385cce5a28507e97ab09239159a87"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.67", shell_output("#{bin}/nerve --version")
  end
end

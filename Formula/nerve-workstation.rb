class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.68/nerve-workstation-0.0.68.tar.gz"
  sha256 "2148d1fc639104130fc957c70a6c1e52544b069d8eecf6c3a8804d5a166b6502"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.68"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "21e420a17f0d9a37656071943864f854be3f92a5449c624380757daab498bb0e"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.68", shell_output("#{bin}/nerve --version")
  end
end

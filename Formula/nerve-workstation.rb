class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.63/nerve-workstation-0.0.63.tar.gz"
  sha256 "08b9aec6aa19404bbe24adfd3869bfdccd844cc9dc1f540420d321ed2e17c8df"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.63"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "dac7eee15efb5619ad86ac5c3426b5471f643d580d38b80692e0ddbdc3668654"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.63", shell_output("#{bin}/nerve --version")
  end
end

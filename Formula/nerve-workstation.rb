class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.58/nerve-workstation-0.0.58.tar.gz"
  sha256 "7dc6267e778b585ec5934861173995b32e6718a0a3851783f95c18034e459026"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.58"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "bc331b9f2616b83cd07cdb7aa5ef1706e62463da8b2e4da1fbdbf39e0c0bd5c8"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so `nerve chat` works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.58", shell_output("#{bin}/nerve --version")
  end
end

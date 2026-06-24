class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.70/nerve-workstation-0.0.70.tar.gz"
  sha256 "ea28c8d6e0199abf244f3eaa38d7636f146ec4c195d3673980ea428bde888801"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.70"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "a8cfe14b1ae59d500471e185bffd9d010eb49bc62ddc99c704d4db360f81f900"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.70", shell_output("#{bin}/nerve --version")
  end
end

class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.75/nerve-workstation-0.0.75.tar.gz"
  sha256 "fa18982334e8ab85d08ad60e40f4e48502dabc4f360d61300d76054ee4453afa"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.75"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "913ad39261c9869c003f8aef6616b5991e905fe8972d5428947897f86ba5c00c"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.75", shell_output("#{bin}/nerve --version")
  end
end

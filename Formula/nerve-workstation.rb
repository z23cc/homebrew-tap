class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.72/nerve-workstation-0.0.72.tar.gz"
  sha256 "622a7202361218cfa4a91155a7d47ecded1ed45376a845f32503d82cad6c6158"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.72"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "1883bc5562163bf99724fac11f0be89d5b0129b17befe8130345a0b560aa27f4"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.72", shell_output("#{bin}/nerve --version")
  end
end

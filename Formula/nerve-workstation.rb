class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.71/nerve-workstation-0.0.71.tar.gz"
  sha256 "a3aef3e247cb0867f3414cdb09a98c8e4e5db0c4c55b42489988764a8b0b4660"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.71"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "ed026ede814e42bf5518a05c186f4349573fa6db2b6602112e360c9c42e94e8d"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.71", shell_output("#{bin}/nerve --version")
  end
end

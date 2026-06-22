class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.64/nerve-workstation-0.0.64.tar.gz"
  sha256 "bcaf0755c30c3c0eadcccb116200427a490f4935ea03943acbbca024703573dc"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.64"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "5bfc0ec76f6bcbab5489065dc3a406bc2d513ab52a7710e73256d01800e87916"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.64", shell_output("#{bin}/nerve --version")
  end
end

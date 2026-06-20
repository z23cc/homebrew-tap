class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.55/nerve-workstation-0.0.55.tar.gz"
  sha256 "01ea5db6aa557fb54289987fd14f7843655bd2ae5a94623dc7958b2b1f1e7e96"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.55"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "de29e586820424227a5bdc6a2c4945045765443a6aa176d8f17c1cbabd190991"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so `nerve chat` works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.55", shell_output("#{bin}/nerve --version")
  end
end

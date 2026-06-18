class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.34/nerve-workstation-0.0.34.tar.gz"
  sha256 "ec55d88de8ebf6f8ca84c167adadbc86ec253b34bf28cf3a72929690748a88f0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.34"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "a78bb6f28afe0df488c8bb589f5e8e0aa867d8bc871acaafa09d5cc74431b218"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.34", shell_output("#{bin}/nerve --version")
  end
end

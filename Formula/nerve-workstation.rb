class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/context-engine-rs"
  url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.31/context-engine-rs-0.0.31.tar.gz"
  sha256 "ad3ed384873facd9e10ee0588772db1c93be42a8e6cb0398aff6fbcf5b163d1e"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/context-engine-rs/releases/download/v0.0.31"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "09db0ce67b9caa1e7a4ba87389a5391f8400ac1e7b983a8621ba7c3ec08e1723"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.31", shell_output("#{bin}/nerve --version")
  end
end

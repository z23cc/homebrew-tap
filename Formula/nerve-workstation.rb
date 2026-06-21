class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.61/nerve-workstation-0.0.61.tar.gz"
  sha256 "c988afb4e41afabf38a55aa4e9be736f534ae78441a41c8096ca98ff6764d9d2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.61"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4f3da151a9870cf11981e0c4bcd71f0a9d60013325b9ec5dadb81da8b241940b"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.61", shell_output("#{bin}/nerve --version")
  end
end

class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.51/nerve-workstation-0.0.51.tar.gz"
  sha256 "8425dd5a0952580cc19137182b0963c6cfd5634ee04e2e6c32f8885e96393d5e"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.51"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "ca04e10d5b05312a267f9396f7f32ecf53c517c3c8b5c51ad3f61377b816c7a2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
  end

  test do
    assert_match "nerve 0.0.51", shell_output("#{bin}/nerve --version")
  end
end

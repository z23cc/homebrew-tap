class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.56/nerve-workstation-0.0.56.tar.gz"
  sha256 "b7f14ded7b27bf9b97c199725da6630fc039c13151c06d052269b30b0973caef"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.56"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "661987e91afad7bf918b1645aaa858a52321e1e97d598c0c952a21f1529e378f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "semantic", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.56", shell_output("#{bin}/nerve --version")
  end
end

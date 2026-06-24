class NerveWorkstation < Formula
  desc "Local AI workstation runtime and MCP adapter"
  homepage "https://github.com/z23cc/nerve-workstation"
  url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.69/nerve-workstation-0.0.69.tar.gz"
  sha256 "dfad6e21aab4b28b2173a79436153e85af27eaa5fad8cf5f50814cf48b935b24"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/z23cc/nerve-workstation/releases/download/v0.0.69"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "a2644fedf4d837c245ac47e3be3124114f6f6ffef872205cf4eaa3dfacca544e"
  end

  depends_on "rust" => :build

  def install
    # Engine + the Rust terminal UI client, so  works out of the box.
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-workstation")
    system "cargo", "install", *std_cargo_args(path: "crates/nerve-tui")
  end

  test do
    assert_match "nerve 0.0.69", shell_output("#{bin}/nerve --version")
  end
end

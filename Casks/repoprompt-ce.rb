cask "repoprompt-ce" do
  version "1.0.22-grok-dev"
  sha256 "57a8bc58aabe3787f61436f82a5116a08489519761a306a71f4b08ae06fa67fe"

  url "https://github.com/z23cc/repoprompt-ce/releases/download/grok-dev-1.0.22/RepoPrompt-CE-grok-dev-1.0.22.zip",
      verified: "github.com/z23cc/repoprompt-ce/"
  name "RepoPrompt CE"
  desc "RepoPrompt CE with Grok Build ACP provider (personal, non-notarized dev build)"
  homepage "https://github.com/z23cc/repoprompt-ce"

  app "RepoPrompt CE.app"

  caveats <<~EOS
    PERSONAL, NON-NOTARIZED build signed with an Apple Development certificate.
    Gatekeeper blocks non-notarized downloads, so install with --no-quarantine:

      brew install --cask --no-quarantine z23cc/tap/repoprompt-ce

    (or, after a normal install, right-click "RepoPrompt CE" in /Applications and
    choose Open the first time, or run:
      xattr -dr com.apple.quarantine "/Applications/RepoPrompt CE.app").

    Secure storage is bound to the local signing fingerprint and is not portable
    across machines. This build is for personal use only.
  EOS

  zap trash: [
    "~/Library/Application Support/RepoPrompt CE",
    "~/Library/Caches/com.pvncher.repoprompt.ce",
    "~/Library/Preferences/com.pvncher.repoprompt.ce.plist",
  ]
end

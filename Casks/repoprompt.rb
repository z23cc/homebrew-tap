cask "repoprompt" do
  version "1.0.22-grok-dev"
  sha256 "57a8bc58aabe3787f61436f82a5116a08489519761a306a71f4b08ae06fa67fe"

  url "https://github.com/z23cc/repoprompt-ce/releases/download/grok-dev-1.0.22/RepoPrompt-CE-grok-dev-1.0.22.zip",
      verified: "github.com/z23cc/repoprompt-ce/"
  name "RepoPrompt"
  desc "RepoPrompt CE + Grok Build ACP fixes (personal, non-notarized; installs as 'RepoPrompt')"
  homepage "https://github.com/z23cc/repoprompt-ce"

  # Install under a distinct name so it does NOT overwrite an official
  # "RepoPrompt CE.app". Each app resolves its own bundled repoprompt-mcp, so the
  # two coexist safely. (Same bundle id, so app settings under
  # ~/Library/Application Support/RepoPrompt CE are shared; secure storage is keyed
  # to this build's signing fingerprint and stays separate.)
  app "RepoPrompt CE.app", target: "RepoPrompt.app"

  caveats <<~EOS
    Installs as "RepoPrompt.app" (does not touch any official RepoPrompt CE).

    PERSONAL, NON-NOTARIZED build signed with an Apple Development certificate.
    Homebrew quarantines downloads; after install, clear the quarantine so
    Gatekeeper allows it:

      xattr -dr com.apple.quarantine "/Applications/RepoPrompt.app"

    (or right-click "RepoPrompt" in /Applications and choose Open the first time).

    For personal use only; secure storage is bound to the local signing fingerprint.
  EOS
end

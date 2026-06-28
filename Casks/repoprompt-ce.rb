cask "repoprompt-ce" do
  version "1.0.22-grok-dev"
  sha256 "57a8bc58aabe3787f61436f82a5116a08489519761a306a71f4b08ae06fa67fe"

  url "https://github.com/z23cc/repoprompt-ce/releases/download/grok-dev-1.0.22/RepoPrompt-CE-grok-dev-1.0.22.zip",
      verified: "github.com/z23cc/repoprompt-ce/"
  name "RepoPrompt Grok"
  desc "RepoPrompt CE + Grok Build ACP fixes (personal, non-notarized; installs as 'RepoPrompt Grok')"
  homepage "https://github.com/z23cc/repoprompt-ce"

  # Install under a distinct name so it does NOT overwrite an official
  # "RepoPrompt CE.app". Each app resolves its own bundled repoprompt-mcp, so the
  # two coexist safely. (Same bundle id, so app settings under
  # ~/Library/Application Support/RepoPrompt CE are shared; secure storage is keyed
  # to this build's signing fingerprint and stays separate.)
  app "RepoPrompt CE.app", target: "RepoPrompt Grok.app"

  caveats <<~EOS
    Installs as "RepoPrompt Grok.app" (does not touch any official RepoPrompt CE).

    PERSONAL, NON-NOTARIZED build signed with an Apple Development certificate.
    Gatekeeper blocks non-notarized downloads, so install with --no-quarantine:

      brew install --cask --no-quarantine z23cc/tap/repoprompt-ce

    (or right-click "RepoPrompt Grok" in /Applications and choose Open the first
    time, or run:  xattr -dr com.apple.quarantine "/Applications/RepoPrompt Grok.app").

    For personal use only; secure storage is bound to the local signing fingerprint.
  EOS
end

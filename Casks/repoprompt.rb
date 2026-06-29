cask "repoprompt" do
  version "1.0.22-ad2db00"
  sha256 "893c9166f85ecd2fe11ddb1b2988866a1593a8da0451e739c528c4a23bea4432"

  url "https://github.com/z23cc/repoprompt-ce/releases/download/repoprompt-1.0.22-ad2db00/RepoPrompt-1.0.22-ad2db00.zip",
      verified: "github.com/z23cc/repoprompt-ce/"
  name "RepoPrompt"
  desc "RepoPrompt CE personal Homebrew build (repoprompt-1.0.22-ce35ea1; non-notarized; installs as RepoPrompt)"
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

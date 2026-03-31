# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.197.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.197.0/mirrord_mac_universal.zip"
    sha256 "ef80dd9e8a0a3edaae3ff953f6aa1ea5e1237d2f09bd045bca285e4296a57e3d"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.197.0/mirrord_linux_aarch64.zip"
      sha256 "e28294c9ecd012164b88baa6faef6a1c2a009a9cb3c93a511f84b1408edf6776"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.197.0/mirrord_linux_x86_64.zip"
      sha256 "086d9a3d4aac09ff832a7e8dcc942cc162e6da71d431eb1d8d0da14d5d58d147"
    end
  end

  def install
    bin.install "mirrord"
  end

  def caveats
    <<~EOS
      mirrord has been installed, but if you'd like shell completions you'll
      need to manually generate the completions for your shell like

        mirrord completions <bash|zsh|fish>

      To ensure it's always available you can add it to Homebrew's default locations.
      Follow their instructions here: https://docs.brew.sh/Shell-Completion
    EOS
  end

  test do
    output = shell_output("mirrord --version")
    assert_match "mirrord #{version}\n", output
  end
end

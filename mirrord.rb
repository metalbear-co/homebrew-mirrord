# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.160.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.160.0/mirrord_mac_universal.zip"
    sha256 "266d8905d7e318e407f0ae1b55fd5ac1c0baf827fe4215392c01f994dda1590a"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.160.0/mirrord_linux_aarch64.zip"
      sha256 "8bfd08e3859f8ea1345c4322a548d1770bc3f1dbe195f85aa7d40208f70aafad"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.160.0/mirrord_linux_x86_64.zip"
      sha256 "715f863d56b48ee2ff17a0e33e39ad5a5b7acb2f6748cf0eabc9a5e282f91150"
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

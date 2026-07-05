# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.229.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.229.0/mirrord_mac_universal.zip"
    sha256 "77299ffd689b90acf1a165259a338859e9d52ee3bdd22ee1390232a44577fff9"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.229.0/mirrord_linux_aarch64.zip"
      sha256 "126e47554a2f0ad99c5d74859bed1cf29a64d960a479d9a60a4ae2fe45b3db67"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.229.0/mirrord_linux_x86_64.zip"
      sha256 "ccbcfb0fb63b5ff368deb4b869e3891ebd111ce4e659dca2ed2f5a95455970d4"
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

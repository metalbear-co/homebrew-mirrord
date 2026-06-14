# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.217.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.217.1/mirrord_mac_universal.zip"
    sha256 "b049a32e137a25dfb63350020b43f6600ade9900d46685b9967a57045cf2d157"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.217.1/mirrord_linux_aarch64.zip"
      sha256 "4393670d95d53596acfaa56fb540ff80c2c1c7736517a7fafe407af19fd5fd52"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.217.1/mirrord_linux_x86_64.zip"
      sha256 "62e442a803d6d2e9128515ac01dda741b4522a750d1f9dfd8924ecd0f29c7e72"
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

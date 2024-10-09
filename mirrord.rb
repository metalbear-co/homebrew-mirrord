# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.119.1/mirrord_mac_universal.zip"
    sha256 "c12f1d0cce4e1833bbe849fa4801fa6327535f46cc58c75fe2e2444ba4998086"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.119.1/mirrord_linux_aarch64.zip"
      sha256 "e39fbf0fa1d11e2b6e847987a11c4c39012907a54ae7339ca8d2c7b630ee43d2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.119.1/mirrord_linux_x86_64.zip"
      sha256 "093fbfac84060cf56668b223004b9ff4f18a1730f072b46478fae80abb1d77ed"
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

# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.236.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.236.1/mirrord_mac_universal.zip"
    sha256 "6550e2ca7514381471ff0e6d5f35cdd50bfc5d29745a62fdc7613fba38625650"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.236.1/mirrord_linux_aarch64.zip"
      sha256 "7bb5a9b1e5308530eba83e318b05d359c5f05bf9637a53b2d69525859f79bb7a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.236.1/mirrord_linux_x86_64.zip"
      sha256 "f70bc4eac6e3098c57c0af679c3a498b2d527a72ee81e3a06a324ee4bf16bb9a"
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

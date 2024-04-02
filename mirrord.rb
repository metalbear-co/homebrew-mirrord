# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.95.0/mirrord_mac_universal.zip"
    sha256 "c9641664cfd21e80ccf24214798fe79c2973a0197021f828a304b7e16c6a3d63"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.95.0/mirrord_linux_aarch64.zip"
      sha256 "7f93915e42d0434b0fa9e8d43b5e44e5f25077a2cd0658eb70d70b60ee6925b1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.95.0/mirrord_linux_x86_64.zip"
      sha256 "e0fe2f03243e1fbe056c7375fd77e1b6f582e2a7290fee5b177d8c7121d234d5"
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

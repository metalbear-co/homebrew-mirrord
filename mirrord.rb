# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.146.0/mirrord_mac_universal.zip"
    sha256 "213bdfe1c37536e7139631d2be9703bba2d7ce7e3b486e056eaf095e04a466d3"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.146.0/mirrord_linux_aarch64.zip"
      sha256 "e226da1736373d40a5db25bf31754bf5013c3d066ea1efe484f6200ecf1894df"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.146.0/mirrord_linux_x86_64.zip"
      sha256 "d16ce10f47d2ddb30a154290af689912c37d640f78dbbd2236027ce98d52ea7d"
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

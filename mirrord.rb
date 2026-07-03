# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.228.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.228.0/mirrord_mac_universal.zip"
    sha256 "93724ae3a528e18fbbcf2be3023f1a82dc14c9641f56d7b0f7005f06c6264f9e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.228.0/mirrord_linux_aarch64.zip"
      sha256 "9357ea836d61cd8ee79c7602ca55c1cf1ee604b1ffee01023e402c427b6d58cc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.228.0/mirrord_linux_x86_64.zip"
      sha256 "a0172ebaf45e3618f36bf0589597b6aaeb6613ca8e1d641a3b30c8a66e538b08"
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

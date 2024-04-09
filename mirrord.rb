# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.96.0/mirrord_mac_universal.zip"
    sha256 "70619b99ad380d0daee58876b1a15024241a150cea394cbaeec749bbc5f70c60"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.96.0/mirrord_linux_aarch64.zip"
      sha256 "638cf76d525e9fdd904300318831c03e4b6eaf495331f97d027e666aec7849df"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.96.0/mirrord_linux_x86_64.zip"
      sha256 "317c7db7d976c7b10581070e52a7bcef8bfaef5ae72ec1aed6105b4c4ab88927"
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

# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.75.0/mirrord_mac_universal.zip"
    sha256 "31b0ded78b5771a7426adb62174f1ef03107e98f0bad62f01ed56bff8e4c08f1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.75.0/mirrord_linux_aarch64.zip"
      sha256 "f057be61164b3e60e5cb3d24292e684afd2c0eab86d960dfc9c59a4da1618fe0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.75.0/mirrord_linux_x86_64.zip"
      sha256 "e6eac458047d382570b856ed3cf7660c782ccf21cae778acd444cee91ce90480"
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

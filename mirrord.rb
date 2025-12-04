# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.175.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.175.0/mirrord_mac_universal.zip"
    sha256 "9e59bd33dae527e854e907e3197f4dbb79bcadfec0858d2944009f713cccd2ac"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.175.0/mirrord_linux_aarch64.zip"
      sha256 "1029cf3301f8f7e503dd9da527c06eb297297e04f9ae495ee1b697b878bd5d48"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.175.0/mirrord_linux_x86_64.zip"
      sha256 "063f7f9543d289201138fcc20ad229e91ed8326145d36e7fa3d1b5258f36b828"
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

# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.251.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.251.0/mirrord_mac_universal.zip"
    sha256 "c96c13ef11fb14757fd763bb8dc0309adabcfd5a7fba85d124db45d923308d51"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.251.0/mirrord_linux_aarch64.zip"
      sha256 "85e11f06c928c4714c0818b9634fc97b36e8b1f3b79b9a5926e4e6c01447087c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.251.0/mirrord_linux_x86_64.zip"
      sha256 "1009bdf249e860e08339341af025d9adef3d923a5fb1d7f7caac29d2adfa3322"
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

# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.142.2/mirrord_mac_universal.zip"
    sha256 "f4004bc3328a4dba82f3137d09fa3b666f3cf14d4087ce6239f3b48b5dbd6405"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.142.2/mirrord_linux_aarch64.zip"
      sha256 "3f398c1c0ba7478a74880d5715292fd59f839490bf760e899141bf400aa9d1bf"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.142.2/mirrord_linux_x86_64.zip"
      sha256 "bbb89173e921cdf49d4597f378b90225bc3fa98387855da94f6a8ffc839b638d"
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

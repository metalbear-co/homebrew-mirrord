# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.202.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.202.0/mirrord_mac_universal.zip"
    sha256 "1abf76177fc9882153d70c773b6fcf9d196f79675d396ecbcce2dd6cffd23b3a"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.202.0/mirrord_linux_aarch64.zip"
      sha256 "453ae4dfb69e31d4fdd8d9313b46470f8241a4a492f9654e8c768c0f4b46ffd0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.202.0/mirrord_linux_x86_64.zip"
      sha256 "2f5dc010505ea39b21a5dc3987261d1dec532d73c176a78424217dcd24b09401"
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

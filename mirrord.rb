# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.118.0/mirrord_mac_universal.zip"
    sha256 "39d58df8b6c458be1ca2361a6436ca0302309c60a53eaf870299dee179136c5b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.118.0/mirrord_linux_aarch64.zip"
      sha256 "d45646cc518ced8f86b09a4e074121e75124a2a06ef767c258f4a9aeee123032"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.118.0/mirrord_linux_x86_64.zip"
      sha256 "4776e9d54ee5bad3f349902b134c578dc39afb55ab842072c54cf96d6774afb7"
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

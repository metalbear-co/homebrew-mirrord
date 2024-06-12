# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.105.0/mirrord_mac_universal.zip"
    sha256 "8bcd5d0d6a5e81034082fa7cefd7baa46904805e60bd7ebcc259309fe1f5d2cf"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.105.0/mirrord_linux_aarch64.zip"
      sha256 "0feedf37d917edcdd009b7842477e79def36473f37d8afeba89cda4666019f68"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.105.0/mirrord_linux_x86_64.zip"
      sha256 "c75df9a1f98b6b208fe5a648c74453908b271d1bf642d8203d9ca95e713ddc9f"
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

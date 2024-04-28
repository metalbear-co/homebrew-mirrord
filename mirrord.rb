# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.99.0/mirrord_mac_universal.zip"
    sha256 "ca03629ffa93efc67f04f02713e55af51c956aba9e6ff47ab8d8e3d05c5e98a9"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.99.0/mirrord_linux_aarch64.zip"
      sha256 "687eda89bf8ec1fa994515e0b8dfeeb6548b98eca4c1f6742eb525ef2e7239a8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.99.0/mirrord_linux_x86_64.zip"
      sha256 "c6cca0fba2d30faed295a9a4d4b3051a867b05b8299f143fba8d5aacd227cdb4"
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

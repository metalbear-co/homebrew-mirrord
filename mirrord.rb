# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.99.2/mirrord_mac_universal.zip"
    sha256 "70607d45b792939c3598cc374ddff9790b9f839e6e2bd192c13735a313b68b8b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.99.2/mirrord_linux_aarch64.zip"
      sha256 "26f73864df1b9fcea385f4902e8d98d9552e3ea2f7ce5719d98b29baa0ca688e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.99.2/mirrord_linux_x86_64.zip"
      sha256 "23c63b790523b6007cc21ae5f1fcf9dd84563182b683591c56bde70381f578a3"
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

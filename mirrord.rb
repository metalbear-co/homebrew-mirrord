# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.209.2"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.209.2/mirrord_mac_universal.zip"
    sha256 "05ed239a7a0ec12d01ed471b14cb6b91367e4f4806d2f7338e3fe4deebbb0143"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.209.2/mirrord_linux_aarch64.zip"
      sha256 "8882199e42b11cddc25d44a3fd87c9ffd09488a49b35075c6ed6b716820c5ae6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.209.2/mirrord_linux_x86_64.zip"
      sha256 "856f352d9e1b3122d2bc276427894744f91e8cfdce1f35a1ea2be223fa9d7a40"
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

# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.93.0/mirrord_mac_universal.zip"
    sha256 "e5af393e5e4736b00555291d0e9dcc88c17d71f72def1690b9db3b5166bcc8b6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.93.0/mirrord_linux_aarch64.zip"
      sha256 "912a789eb0c7016252384a025f7f4aeb0dec0b1f3f313d51b1724d4cf72f410c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.93.0/mirrord_linux_x86_64.zip"
      sha256 "89336ffd2256373582109a8882eb8e4fe17fc029a468fc03b63a866f5a9f9c4d"
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

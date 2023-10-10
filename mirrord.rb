# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.71.2/mirrord_mac_universal.zip"
    sha256 "adf3ac52a4b08d75bf93581af4c82ae19246c9637daac774d73e0b9915528f11"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.71.2/mirrord_linux_aarch64.zip"
      sha256 "e528641f4b180f10fe019037558127fed01fbc17de54f43a05c0d09f1bb9a5fb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.71.2/mirrord_linux_x86_64.zip"
      sha256 "32fd9b5622b00fc40a3cd3e83554a7311ea09d64a784fbf3219a5749faee8309"
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

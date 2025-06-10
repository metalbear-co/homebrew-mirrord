# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.144.0/mirrord_mac_universal.zip"
    sha256 "c1cd55ef9b8fea4c869cb63c1c77689efe909465543db6035b1532b78cdea09b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.144.0/mirrord_linux_aarch64.zip"
      sha256 "4bcfbb1b1dbe300a903fcac816890d2182229edab3ca684843b61b148b4ca164"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.144.0/mirrord_linux_x86_64.zip"
      sha256 "ccd998cfb061a1d50702a325f3da2ff3384a28e396ef98c225ca01b08387e403"
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

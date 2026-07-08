# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.231.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.231.0/mirrord_mac_universal.zip"
    sha256 "25365f670623411d9044b9c6938eba0247de72bc6fc30c5ca6fece614bb2d9e3"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.231.0/mirrord_linux_aarch64.zip"
      sha256 "d16fde2dd2fca3c4acb4ef787d58888935623da8a5071fd575b0a6590a1959bb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.231.0/mirrord_linux_x86_64.zip"
      sha256 "b67322d1c9861c4cf20b4310ceb232d6d1b289debfbff51fd202b248b3ca92cd"
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

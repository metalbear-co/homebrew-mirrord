# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.192.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.192.1/mirrord_mac_universal.zip"
    sha256 "cb758c9da940eb11b930b2decc3c49833b7637d566f72a1f13f70cd1d80de085"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.192.1/mirrord_linux_aarch64.zip"
      sha256 "b6fd9756a9136dd9db9f5a1809d65f3f5c750a5faeba3e4f25bd0961aa14c086"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.192.1/mirrord_linux_x86_64.zip"
      sha256 "8169a55dbadd135831cc2d6263ed96dd9d658d29fb8f7387adb392a9b6f8431b"
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

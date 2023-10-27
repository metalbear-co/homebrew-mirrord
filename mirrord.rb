# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.74.0/mirrord_mac_universal.zip"
    sha256 "f3b3bc7c2f04144cfaea2fd5be7b138932ec34af226d86dc41b889ad6f5e1760"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.74.0/mirrord_linux_aarch64.zip"
      sha256 "1213e401a0cab5fb26226594121966994dd93e7cf24fc44601397e645e1075a2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.74.0/mirrord_linux_x86_64.zip"
      sha256 "86b4ab81c14a73873de3e279ebcf1f4be2446736c9d01ee0a8fdd8cbcdaa20eb"
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

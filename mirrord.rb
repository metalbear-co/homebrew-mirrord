# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.207.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.207.0/mirrord_mac_universal.zip"
    sha256 "2bf50a2822e1de887bd6f95abe7912ed230e70c6dd3184c6a195f2cc12787f35"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.207.0/mirrord_linux_aarch64.zip"
      sha256 "51cb36e5bba327b17e1bfaae95b403e54392c60a8851f46d6e704b7bef713dd0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.207.0/mirrord_linux_x86_64.zip"
      sha256 "0505ed83eb51a6d70874298afdfd6a11cef59913706b4b02aa920340d850aa46"
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

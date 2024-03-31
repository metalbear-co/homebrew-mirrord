# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.93.1/mirrord_mac_universal.zip"
    sha256 "b03722b630040baf1a638a1b45c162990978cd1a4e6d375aaa41df22a15c8ef1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.93.1/mirrord_linux_aarch64.zip"
      sha256 "533174dd123aa45af4a23b41286b6bb255e9ecf97b0f1e45a157a9aedb661095"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.93.1/mirrord_linux_x86_64.zip"
      sha256 "11a39c41cdb575f162d81751a675019126ac439f1e681c1db8b8ceb7aa1427dc"
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

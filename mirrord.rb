# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.218.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.218.0/mirrord_mac_universal.zip"
    sha256 "7ba609b16c1fcd3167b588a59ea3258b09c418e61017299818a610e74dca71d6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.218.0/mirrord_linux_aarch64.zip"
      sha256 "74ae643bf3d7328ad13ae731d8e4fb585a573c0eab5b050ecaf81ad5c2761388"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.218.0/mirrord_linux_x86_64.zip"
      sha256 "ac87677e6e26117e7b5b1c9bd03ce413b4554be6793b31dcf84ee54f9efb079e"
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

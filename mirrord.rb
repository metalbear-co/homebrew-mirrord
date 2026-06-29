# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.224.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.224.0/mirrord_mac_universal.zip"
    sha256 "d456d018530696842fd1513b6d82a0048d9561569fd65941cc0c1a573bf3667c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.224.0/mirrord_linux_aarch64.zip"
      sha256 "ba902b27bd31bf7602f1cf22f42d00ed07eba52107cf280885648e90c62a17c1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.224.0/mirrord_linux_x86_64.zip"
      sha256 "3e6d4210a0f33b1172618dd6786e18d272b0dd9de6fdfe6ed06c1ff5a1663b5f"
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

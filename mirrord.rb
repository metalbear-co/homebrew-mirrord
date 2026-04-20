# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.204.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.204.0/mirrord_mac_universal.zip"
    sha256 "f9cc1e0dabc9c5e6ae47aaff6344d680ccde94218cf9deee53fa9a413814645b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.204.0/mirrord_linux_aarch64.zip"
      sha256 "1465206bd24a890a03965572697a2adae2fd57fb0a2bffea637f0c0ed8b05cbf"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.204.0/mirrord_linux_x86_64.zip"
      sha256 "d66245b63d4caa71eba001a7ce570a996655febf27d3a1d1f3040f79771210de"
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

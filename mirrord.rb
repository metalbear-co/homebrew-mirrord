# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.235.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.235.0/mirrord_mac_universal.zip"
    sha256 "9e7af1af16d326c50753ac3d447228170ae8460f2ee1305f3b02042d5277676a"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.235.0/mirrord_linux_aarch64.zip"
      sha256 "ceb418c098e5d18929aad8b2eb76bc26b7bf1738dd18c995951ccde734c76fe0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.235.0/mirrord_linux_x86_64.zip"
      sha256 "bbe2b766486cc46e6577b03ff9f8ee750802a2807591ef152af969493c7341a4"
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

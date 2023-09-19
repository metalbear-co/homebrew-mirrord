# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.68.0/mirrord_mac_universal.zip"
    sha256 "2ce5d18705880cc29568b40413b10fb38adbad6a34ed0db660f7784036da56a3"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.68.0/mirrord_linux_aarch64.zip"
      sha256 "0959c1ec621558775fb8599bc591b1c19c564835190c639c19c0aa141e1b01ed"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.68.0/mirrord_linux_x86_64.zip"
      sha256 "7635e85e278bae890f1ab3a6e181de34cc9257d4145cc5d2dec2fd119c612ad3"
    end
  end

  def install
    bin.install "mirrord"
  end

  def caveats
    <<~EOS
      mirrord has been installed but you'll need to manually generate and source
      the completions for your shell like:

        source <(mirrord completions bash)

      And equivalent for other shells. Check the documentation for more info:

        mirrord completions --help
    EOS
  end

  test do
    output = shell_output("mirrord --version")
    assert_match "mirrord #{version}\n", output
  end
end

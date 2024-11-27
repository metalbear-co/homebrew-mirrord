# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.125.1/mirrord_mac_universal.zip"
    sha256 "bc7928018c1fb66b163adbe01ec5d4fedc1296a8f9a5d9cab739e98095bcc10e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.125.1/mirrord_linux_aarch64.zip"
      sha256 "e39cf0e515eba0fc1c3f9c181f3a1cf5d661a9286e299e548c353a368759d379"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.125.1/mirrord_linux_x86_64.zip"
      sha256 "1929962721529bd7c6c6974e2ad9ca1ae4c189dca978ba796d44ffd4fbd7c482"
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

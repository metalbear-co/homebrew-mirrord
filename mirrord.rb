# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.133.1/mirrord_mac_universal.zip"
    sha256 "3974e0aabf348a7eb991e9cf75bbb2f776c7b7c03ee785d6c4461d1d89947d03"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.133.1/mirrord_linux_aarch64.zip"
      sha256 "b25dc61c5ee5f422ff53139bb8aeae4055eb6bc87cc018dc2065e6308d0f6aa6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.133.1/mirrord_linux_x86_64.zip"
      sha256 "a1115012c46abc89eddba9a0f76f65e84614ed953b2a10d45eaadf4d863c1cf6"
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

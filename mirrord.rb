# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.78.2/mirrord_mac_universal.zip"
    sha256 "671090e4e3d6dbfff10981555ad14775793fc12f5f07048bf0217fd43eabcf9e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.78.2/mirrord_linux_aarch64.zip"
      sha256 "bbe17b386e4b99cb3e4eaca4c4d4b4c40c3c02f859c03e8b39cfc45c59621ec3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.78.2/mirrord_linux_x86_64.zip"
      sha256 "04231639de46ed37144a8b96c9e9f68b67136e74e4e94d1f5cb0663d0129f6c1"
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

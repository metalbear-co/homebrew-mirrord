# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.110.0/mirrord_mac_universal.zip"
    sha256 "2a554bb6af5ab737574c2ff49e4d0cf761246d54999182e63841d39842b93c23"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.110.0/mirrord_linux_aarch64.zip"
      sha256 "30ece4ebe4ffc9106c9e3fc06f4df31eacdac7fa26fd2f00b5e94615e8ac26ae"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.110.0/mirrord_linux_x86_64.zip"
      sha256 "931c51d73bb5200ed63a4f320f1b4b2f25d4ad4c8d3d8fa852e0e66afd919911"
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

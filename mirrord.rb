# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.131.0/mirrord_mac_universal.zip"
    sha256 "84279c86ad6abe50a29b698ee7a1d3b2ca4db19efb9eb5cf7b22658b7e886fbd"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.131.0/mirrord_linux_aarch64.zip"
      sha256 "e2fd533b6e29620b0d048f528d340a04f649dd7383161f13686357e806ef2643"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.131.0/mirrord_linux_x86_64.zip"
      sha256 "43936a29a83e478aec301b2b61aa59a79094e934751b8a3404e7fe5a0fa3a006"
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

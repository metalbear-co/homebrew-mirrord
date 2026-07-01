# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.226.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.226.0/mirrord_mac_universal.zip"
    sha256 "dd5f15c3f3e7dff8471256af6c8a05e913eef711bae989311ef1676bf17ac081"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.226.0/mirrord_linux_aarch64.zip"
      sha256 "0f284263d77de45e14e446c3d4dbf0b359c1927b4c097bd570d6ebb58edaf19f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.226.0/mirrord_linux_x86_64.zip"
      sha256 "7f34a9d943f1aeb6788d354fa241dd9236081067e8638ceec4d8e29c7b064a10"
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

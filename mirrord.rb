class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  url "https://github.com/metalbear-co/mirrord/releases/download/3.4.0/mirrord_mac_universal.zip"
  sha256 "4ad6657244b54272a00b1ea6c94e7b5683ddc42ed92157d6e1d42e3ae8450138"
  license "MIT"

  def install
    bin.install "mirrord"
  end

  test do
    output = shell_output("mirrord --version")
    assert_match "mirrord #{version}\n", output
  end
end

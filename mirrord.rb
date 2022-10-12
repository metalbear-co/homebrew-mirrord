class Mirrord < Formula
    desc "Connect your local process and your cloud environment"
    homepage "https://mirrord.dev"
    url "https://github.com/metalbear-co/mirrord/releases/download/2.13.0/mirrord_mac_universal.zip"
    sha256 "847f3eb90d46293f6f26f1e65eebdfb9712ea9b6e0be8438b72c8d7f20aa083b"
    license "MIT"
    head "https://github.com/metalbear-co/mirrord/releases/download/3.0.20-alpha/mirrord_mac_universal.zip"
  
    def install
      bin.install "mirrord"
    end
  
    test do
      output = shell_output("mirrord --version")
      assert_match "mirrord #{version}\n", output
    end
  end
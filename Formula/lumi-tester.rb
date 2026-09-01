class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.35/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "93b66e2771d8ac93e25c42fcf81c70a44feefa95adf41102c655be863381d337"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.35/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "96a02cb5261509be202682c945d559b71fb6ceb43f06293e21630d9975093bb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.35/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "c292796b99cbd930252ac61752ee7a429939f1ee9c79fa119fda7d4c603992af"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.35/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "568592dc3a13c1c67847f2f9cd51f0aa755bf3802a24ccb8c3f72ae26ae079f4"
    end
  end

  def install
    chmod 0755, cached_download
    bin.install cached_download => "lumi-tester"
  end

  def caveats
    <<~EOS
      Run 'lumi-tester system install --all' to install ADB and browser dependencies.
      Run 'lumi-tester ai install' to install the Codex skill and MCP server for AI-assisted test authoring/debugging.
    EOS
  end

  test do
    system "#{bin}/lumi-tester", "--version"
  end
end

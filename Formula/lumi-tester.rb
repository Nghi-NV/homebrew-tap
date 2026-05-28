class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.6/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "59361b99c30b7069c23412d4a6d00b00d117ace4418244bda9b61b226d03118c"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.6/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "dd01a6c237143464715bec624ae893ce3b7bbd4b718d575ea992e03ab48487c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.6/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "15c9196a1dc0471d0f5e7d76470e10c564c634ff1aaa54cacaca17f46d16232e"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.6/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "fa879f0d024801337ccd30637cda5ca5ee6ec4adaa661fc8166eaf8c3733a805"
    end
  end

  def install
    chmod 0755, cached_download
    bin.install cached_download => "lumi-tester"
  end

  def caveats
    "Run 'lumi-tester system install --all' to install ADB and browser dependencies."
  end

  test do
    system "#{bin}/lumi-tester", "--version"
  end
end

class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.5/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "827a680fea99afb4a38708cdcff41a5ab96a5e1e2af2dd9acf0b29ebbab87291"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.5/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "3080faeeacc1b31c0735b72d7ee3de2605b8f15b6a79167f98116c37ffecef67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.5/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "2e803605c1326faa323864e6f5984a5ae04ed7039dd09ac01fd9e47b1ff5fc20"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.5/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "0c82746a7bbe43c7e9bd4dc2acf011950a8dea4d988886bdc55707cf3e33835b"
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

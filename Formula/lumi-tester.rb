class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.43/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "42f9560cc6426e25d85a45921af0c96f52aacfae26086d391e4d490390e5a174"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.43/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "548c1dbe2dbf91f7969f2e76d77e2a3d9702e86001da71a3732b951566c2b4aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.43/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "ed09c4caaa159676a405d5376afbe1c32f5406454765f8a3a49f2da472186630"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.43/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "537ef6540acdb68532da61dff8a76bf9c34a1b2d378e5265fe947ba97c5734c6"
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

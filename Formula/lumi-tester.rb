class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.36/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "ba0161895f3242b38ea81992dcb73ea4eabc8b4963abf7ed01a60a622e98ada5"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.36/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "09fae2608eed1af1a67ff5a0d8a407a8de3c9f89085eb37790911a3dc78584a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.36/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "3a2d76de07963730693338faa8704c3417e065fb1517fe8eb6d22bb5d47e53c7"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.36/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "d53fde236094ada797cffbb16216a930d5b71a815f6fb77d96923f2ecfc429cd"
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

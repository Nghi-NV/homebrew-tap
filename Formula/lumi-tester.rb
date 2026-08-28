class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.33/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "b733e42d438ca028f63b0892ab04d931bea4b2f246c03376470c72572d80c2fd"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.33/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "0c3881c4f5aea3c8284dee4e32fe3431c2cd2e638a6a2c92d024c95218ad6442"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.33/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "c7e39ea10b8127c5b8d27898e7eb24c8d4370bdcb3e5247fb8f39c55c10d8d5f"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.33/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "d20ac11339749f5c8c57ceb68d65470ff59dd2dfd8556f72a0d81b256e08df30"
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

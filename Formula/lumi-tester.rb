class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.42/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "706adf3084028bb3a5cdf1c10c2e222bcce80531b01ede4fb921a73c9bb93fd6"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.42/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "839ef066cdc9fcc8bdf9311722f8c42be2bdb21de8f790f77e38591407a888ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.42/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "a5e6e0259e2822e995d374e3b22436ddbdaa3d93a137cd178a00996d026bbc58"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.42/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "e113713115703385e0e38c18d300cd8c3d400756ec376e85f40378a902a4b4e0"
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

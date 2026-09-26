class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.44/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "0886f78fa3718a4abcd14fd9be89a4e1213eb45ed4fc33222c24150e68d2eb22"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.44/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "5eda8aefad19457ef22b2d8a209912088d2bf54bb5cb5ea72770f5847f78bd35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.44/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "697c5eb2746ba3a094203929c90e8ae59475499e7b18b512c492ad44616ba5fc"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.44/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "9c4a6c4c5ce357a496dbed0dec5e04a1891a06fa463a580d9f7376df5c66961c"
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

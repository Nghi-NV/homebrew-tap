class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.41/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "663b14229454968f2f737fff22b338a8c22690ac13aec4a0c31f61c3f4736194"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.41/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "12326217200e458b2fe3bcff29a2527a6835c4fb4920abc44a29645a1893bf3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.41/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "0461fb5dd9e7d2ae4561fed752b415ceba318c57697fd44d9192581dd3e7c196"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.41/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "25c663c2f2b5902d7f85a5158b93b941fe0f1ae1a8595d106ae78d5b6663a38a"
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

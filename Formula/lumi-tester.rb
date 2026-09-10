class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.39/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "476275e45d800ab66d51176aafc547570a25a259b3f74547ac8155bce968f89b"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.39/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "9bfecc8124597326ad6e2ae9c074c67aec7433d5e82fb9fb8837a9ef4ebd1b92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.39/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "7751f911edf6c903f3d256342daa032ff7552b5a2981bb0dc53f54d14a590b07"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.39/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "30c946e6f9fae33bed3f8c21c2a527dbff731644118d14129d551f2094161a70"
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

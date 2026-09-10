class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.38/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "b8bf6c7ceae7d8b36bcd6190103bf724c002ece1d4e1e00de873f981172802ee"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.38/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "7387a900dfda98b1a0a55f354fabbe75fecf2423478c468f32808a942baf743a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.38/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "8ad61d0226706f3c5bb8fd90d6261817e933c5a48e483b68d9a8fdb27f6283a6"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.38/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "b007b0b8a3c11099784355716ba1dfa965279d6183a1f1c2445e4afd55fc816c"
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

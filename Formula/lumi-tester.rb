class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.45/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "c9b796944ddc18003e389fb1a62527b12f3e422afe9891afd1e5583f186660fa"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.45/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "e3d674267bc7ec43149eb237770ac50d77b3cd2dc36c498e0e14af652c39a113"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.45/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "0ba8203c2089f401e6b78a684d93826e6a4b50f6582be8a49f6fb1e00728106a"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.45/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "6c2d9f56ab6936ee85f02a91dabaea4c8d673f6d1e1c759209f0e9dce4ac8cd7"
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

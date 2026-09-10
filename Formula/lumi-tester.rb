class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.40/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "7b945d4616137d7795afaa62d1b7de2bbdd479a6d61b7a55d3adf253811df9b6"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.40/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "1fcdc12e72b632d46766945e76971c97d21830b6e96b5b1cd2a7ccc86baf0e23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.40/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "ed6da9b910187611d6bdda6880b6f53159f192fbb319aa7421f0434a868c0238"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.40/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "ec5ae125e179c31c3c6c71da4a7115b38f7f703ca7500b34f143860ed3dd0194"
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

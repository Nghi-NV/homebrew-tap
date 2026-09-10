class LumiTester < Formula
  desc "Multi-platform automation testing CLI"
  homepage "https://github.com/Nghi-NV/nl-tester"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.37/lumi-tester-aarch64-apple-darwin", using: :nounzip
      sha256 "1404ece3fc3dd961c601614b3be67706ce1d732d8c71950843c063b83a015f7e"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.37/lumi-tester-x86_64-apple-darwin", using: :nounzip
      sha256 "a2cdbe4592ac83e1a447ee12fd42172c10add34e96c4f8047f002332a8895a99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.37/lumi-tester-aarch64-unknown-linux-gnu", using: :nounzip
      sha256 "b1fc626f6558eb4a41f23c9a046c0c1334ad744e88958b5a8ba04f86207cd97e"
    else
      url "https://github.com/Nghi-NV/nl-tester/releases/download/v0.1.37/lumi-tester-x86_64-unknown-linux-gnu", using: :nounzip
      sha256 "ac891a1397272e32fcae9bbd5134016492fb02f9ce01a0bddaa12d86a86a6a62"
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

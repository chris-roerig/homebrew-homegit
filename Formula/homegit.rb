class Homegit < Formula
  desc "Your personal Git server. No cloud, no auth, no complexity."
  homepage "https://github.com/chris-roerig/homegit"
  url "https://github.com/chris-roerig/homegit/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "bc2ab038eb96a4aac036235c2de467b7d84c23a24f4a9f0c50823da40f73d557"
  license "MIT"
  head "https://github.com/chris-roerig/homegit.git", branch: "main"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      homegit has been installed!
      
      Start now:
        homegit start
      
      Or start and auto-start on boot:
        brew services start homegit
      
      Configure (optional):
        homegit config
      
      For help:
        homegit help
      
      Configuration: ~/.homegit/config
    EOS
  end

  service do
    run [opt_bin/"homegit", "serve"]
    keep_alive true
    log_path var/"log/homegit.log"
    error_log_path var/"log/homegit.log"
  end

  test do
    system "#{bin}/homegit", "--version"
  end
end

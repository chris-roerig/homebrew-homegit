class Homegit < Formula
  desc "Your personal Git server. No cloud, no auth, no complexity."
  homepage "https://github.com/chris-roerig/homegit"
  url "https://github.com/chris-roerig/homegit/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e3c9041b7d578d529842ecda7ea350bac30214d4c90607320c63f3ea25c5a5c2"
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

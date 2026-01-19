class Homegit < Formula
  desc "Your personal Git server. No cloud, no auth, no complexity."
  homepage "https://github.com/chris-roerig/homegit"
  url "https://github.com/chris-roerig/homegit/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "bc7c3ce16994f27e2ff0e37ca31b7b76b63568d9f40cf2a32472cbe83a92c954"
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

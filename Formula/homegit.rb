class Homegit < Formula
  desc "Your personal Git server. No cloud, no auth, no complexity."
  homepage "https://github.com/chris-roerig/homegit"
  url "https://github.com/chris-roerig/homegit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "53dc3c9f5c927b1c8b99c4a249ba64c20ce8710779cdf73fe48041bafcc415a9"
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
      
      Get started:
        homegit start
      
      Configure (optional):
        homegit config
      
      For help and examples:
        homegit help
      
      Configuration is stored at:
        ~/.homegit/config
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

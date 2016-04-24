class HerokuToolbelt < Formula
  desc "CLI interface to the Heroku Platform"
  homepage "https://toolbelt.heroku.com/"
  url "https://cli-assets.heroku.com/dev/5.0.0-aa7ee7c/heroku-v5.0.0-aa7ee7c-darwin-amd64.tar.xz"
  sha256 "5e8c29b6cdb3f73282a6faf834f18143a7bc9f58b57095b921bb5614c79d8486"
  head "https://github.com/heroku/cli.git"

  bottle :unneeded

  depends_on :arch => :x86_64
  depends_on :ruby => "1.9"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/heroku"
  end

  test do
    system "#{bin}/heroku", "version"
  end
end

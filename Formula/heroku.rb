require "language/node"

class Heroku < Formula
  desc "Command-line client for the cloud PaaS"
  homepage "https://cli.heroku.com"
  url "https://registry.npmjs.org/heroku-cli/-/heroku-cli-7.0.5.tgz"
  sha256 "220560d08d62663166e948ac05b20d1dd0271df56f74ba0626a48aa5db488afa"
  head "https://github.com/heroku/cli.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "94eb7016e2a1bc35c62833fd5cbbc7190a19c86d363823c73c884ce3b10f6bd8" => :high_sierra
    sha256 "42024430259d535caebc77c7a8937ff93371f722787e28b003da8529df0ef133" => :sierra
    sha256 "7d69858583c20c0c338298ef105a59d88e0bee1181d3158a07cdaae62c1dc079" => :el_capitan
  end

  depends_on "node"

  def install
    inreplace "bin/run" do |s|
      s.gsub! "#!/usr/bin/env node", "#!#{Formula["node"].opt_bin}/node"
    end
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"heroku", "version"
  end
end

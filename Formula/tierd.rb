class Tierd < Formula
  desc "Measure outcome per token in software development"
  homepage "https://tiermetric.org"
  url "https://github.com/tiermetric/tier/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "bf8e726e146576c5f552cf1c1d891ece1f4c80997fa615ac47d04e561bff29e8"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=v0.6.3 -X main.commit=c20628ca70c8445f1c56d221d30848dd62c31c2f"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/tierd"
  end

  test do
    assert_match "tierd v0.6.3 ", shell_output("#{bin}/tierd version")
  end
end

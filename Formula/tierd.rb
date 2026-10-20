class Tierd < Formula
  desc "Measure outcome per token in software development"
  homepage "https://tiermetric.org"
  url "https://github.com/tiermetric/tier/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "519eef2e048760b6e6ca6ea9baec4532d3e62e2579e7d4ebab3a5a631bc7b035"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=v0.6.1 -X main.commit=4a0b1a2de6c102945d01fa90b7a98b322d0409c2"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/tierd"
  end

  test do
    assert_match "tierd v0.6.1 ", shell_output("#{bin}/tierd version")
  end
end

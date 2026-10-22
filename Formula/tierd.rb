class Tierd < Formula
  desc "Measure outcome per token in software development"
  homepage "https://tiermetric.org"
  url "https://github.com/tiermetric/tier/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "29454dc7cc4071b868abb5df93cb3d3bb0c5ef2ee1ae2862dd8b62fb5e9a4b84"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=v0.6.2 -X main.commit=e323dabe0de529e4c619f9779bc2a5e2aa5dccb7"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/tierd"
  end

  test do
    assert_match "tierd v0.6.2 ", shell_output("#{bin}/tierd version")
  end
end

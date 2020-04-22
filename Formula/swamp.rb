class Swamp < Formula
  desc "AWS Profile Manager. You can use swamp to switch profiles with ease"
  homepage "https://github.com/felixb/swamp"
  url "https://github.com/felixb/swamp/archive/v0.11.0.tar.gz"
  sha256 "58c517f21160e19015d98a758a94bf8ebfc390cf1b3532c360cc890378ad5163"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/felixb/swamp"

    bin_path.install Dir["*"]

    cd bin_path do
      system "make", "swamp_darwin"
      mv "swamp_darwin", "swamp"
      bin.install "swamp"
    end
  end

  test do
    assert_match /swamp:\ 0.10.0/, shell_output("#{bin}/swamp 2>&1", 1)
  end
end

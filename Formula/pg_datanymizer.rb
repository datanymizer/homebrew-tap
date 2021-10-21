class PgDatanymizer < Formula
  desc "Powerful database anonymizer with flexible rules. Written in Rust."
  homepage "https://github.com/datanymizer/datanymizer"
  version "0.4.0"

  stable do
    if OS.mac?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.4.0/pg_datanymizer-darwin-x86_64.tar.gz"
      sha256 "6bf6ed962cab7d3af3dadcbf80100016bbb479c6c16b5ac8f3d9c5b14f48a217"
    elsif OS.linux?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.4.0/pg_datanymizer-linux-x86_64.tar.gz"
      sha256 "c2fd1ed0d80f8750e394039997fbf67d919e4bf5bbe0e4494831be9add676d0a"
    end
  end

  head do
    url "https://github.com/datanymizer/datanymizer.git"
    depends_on "rust" => :build
  end

  bottle :unneeded

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "pg_datanymizer"
    end
  end

  test do
    system "#{bin}/pg_datanymizer --version"
  end
end

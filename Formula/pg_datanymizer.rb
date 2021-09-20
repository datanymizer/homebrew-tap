class PgDatanymizer < Formula
  desc "Powerful database anonymizer with flexible rules. Written in Rust."
  homepage "https://github.com/datanymizer/datanymizer"
  version "0.3.1"

  stable do
    if OS.mac?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.3.1/pg_datanymizer-darwin-x86_64.tar.gz"
      sha256 "6243468aa6fbd23f0b02ea70f4ca6640c0167aac515bd57d81779089549dc5e3"
    elsif OS.linux?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.3.1/pg_datanymizer-linux-x86_64.tar.gz"
      sha256 "b2f2caee9e9a28eff5b00b3c7c755df7b114ae7b4ec03fa9f7d2490498224e43"
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

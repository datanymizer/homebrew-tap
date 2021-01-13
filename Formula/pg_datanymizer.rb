class PgDatanymizer < Formula
  desc "Powerful database anonymizer with flexible rules. Written in Rust."
  homepage "https://github.com/datanymizer/datanymizer"
  version "0.1.0"

  stable do
    if OS.mac?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.1.0/pg_datanymizer-darwin-x86_64.tar.gz"
      sha256 ""
    elsif OS.linux?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.1.0/pg_datanymizer-linux-x86_64.tar.gz"
      sha256 ""
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
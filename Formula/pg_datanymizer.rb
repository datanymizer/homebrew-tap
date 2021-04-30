class PgDatanymizer < Formula
  desc "Powerful database anonymizer with flexible rules. Written in Rust."
  homepage "https://github.com/datanymizer/datanymizer"
  version "0.2.0"

  stable do
    if OS.mac?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.2.0/pg_datanymizer-darwin-x86_64.tar.gz"
      sha256 "775e679927337bc40b22c77f8b3084fd8fc0abac38b1b872e73661902b1ed961"
    elsif OS.linux?
      url "https://github.com/datanymizer/datanymizer/releases/download/v0.2.0/pg_datanymizer-linux-x86_64.tar.gz"
      sha256 "2773c716252b60e1709d994094647b86fb5520e5377cecc0baf8e3ce7003d8df"
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

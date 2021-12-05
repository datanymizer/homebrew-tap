class PgDatanymizer < Formula
  version_str = "0.5.1"

  desc "Powerful database anonymizer with flexible rules. Written in Rust."
  homepage "https://github.com/datanymizer/datanymizer"
  version version_str

  stable do
    url_template = "https://github.com/datanymizer/datanymizer/releases/download/v#{version_str}/pg_datanymizer-%s-x86_64.tar.gz"
    if OS.mac?
      url format(url_template, "darwin")
      sha256 "85cb9fc4f9eb8a61b684c45907f424dec1470b6cc9084042e1f5e3da294ad07e"
    elsif OS.linux?
      url format(url_template, "linux")
      sha256 "cc5fdb12f0bf2cb64e01c28f61aac24db7836cf03898b79d9cf3712874419c9a"
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

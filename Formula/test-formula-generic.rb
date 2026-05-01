class TestFormulaGeneric < Formula
  desc "Formula to test Action"
  homepage "https://github.com/AlDanial/cloc"
  url "https://github.com/AlDanial/cloc/archive/v1.0.tar.gz"
  sha256 "1b4567ed50555e10920e5bd804a6a4e2c42ec70bb74f14a83f2680fe9eaf9727"
  license "MIT"

  def install
    (buildpath / "test").write <<~EOS
      test
    EOS

    share.install "test"
  end

  test do
    sleep 1
  end
end

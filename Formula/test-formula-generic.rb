class TestFormulaGeneric < Formula
  desc "Formula to test Action"
  homepage "https://github.com/AlDanial/cloc"
  url "https://github.com/AlDanial/cloc/archive/v2.08.tar.gz"
  sha256 "8099b6275c124f662690f2db3581cd2ad4e9ad4e08332288719838ded00d1da5"
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

class TestFormulaPypiUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/AlDanial/cloc"
  url "https://github.com/AlDanial/cloc/archive/v2.10.tar.gz"
  sha256 "a8fac35f4cf42728765580ba11afc2568ad205509a22204663f526169548436d"
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

class TestFormulaPypiUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/AlDanial/cloc"
  url "https://github.com/AlDanial/cloc/archive/v1.94.tar.gz"
  sha256 "c835fe343e1c25194a61eb74d7a36e98413682ed0c3b4d6b8e35a327077bf926"
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

class TestFormulaUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/dawidd6/action-homebrew-bump-formula"
  url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v8.tar.gz"
  sha256 "e27dbd4d8f5eaf21471f1cff4adcb79310250c436bc3cec2e8c68f912dbe2036"
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

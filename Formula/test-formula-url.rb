class TestFormulaUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/dawidd6/action-homebrew-bump-formula"
  url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v7.tar.gz"
  sha256 "38a90d077e56bb5f2192ac079a1c3eec820c431011411a165777ce201e5905b5"
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

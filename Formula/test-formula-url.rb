class TestFormulaUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/dawidd6/action-homebrew-bump-formula"
  url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v10.tar.gz"
  sha256 "2c9581a0676ed34d150942de4d4ee329bf3243313604d518ad7b63f1ace7befe"
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

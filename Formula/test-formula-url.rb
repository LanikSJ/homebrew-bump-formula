class TestFormulaUrl < Formula
  desc "Formula to test Action"
  homepage "https://github.com/LanikSJ/actions-updater"
  url "https://github.com/LanikSJ/actions-updater/archive/v1.0.1.tar.gz"
  sha256 "b1c83ee9d19289eb403ad0863c235fa9c3b3a980c9b13a43cda9fc9413935df4"
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

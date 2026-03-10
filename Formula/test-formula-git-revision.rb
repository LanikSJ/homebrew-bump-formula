class TestFormulaGitRevision < Formula
  desc "Formula to test Action"
  homepage "https://github.com/Debian/dh-make-golang"
  url "https://github.com/Debian/dh-make-golang.git",
    tag: "v0.8.2",
    revision: "9fe6701337d2848541192f973d74851a22b272a1"
  license "MIT"
  head "https://github.com/Debian/dh-make-golang.git"

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

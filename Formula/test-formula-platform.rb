class TestFormulaPlatform < Formula
  desc "Formula to test Action platform-block bumps"
  homepage "https://github.com/dawidd6/action-homebrew-bump-formula"
  license "MIT"

  version = "1"

  on_macos do
    url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v#{version}.tar.gz"
    sha256 "1c890d077e56bb5f2192ac079a1c3eec820c431011411a165777ce201e5905b5"
  end

  on_linux do
    url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v#{version}.tar.gz"
    sha256 "1c890d077e56bb5f2192ac079a1c3eec820c431011411a165777ce201e5905b5"
  end

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

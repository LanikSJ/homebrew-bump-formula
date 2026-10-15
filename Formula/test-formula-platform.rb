class TestFormulaPlatform < Formula
  desc "Formula to test Action platform-block bumps"
  homepage "https://github.com/dawidd6/action-homebrew-bump-formula"
  license "MIT"

  version = "10"

  on_macos do
    url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v#{version}.tar.gz"
    sha256 "2c9581a0676ed34d150942de4d4ee329bf3243313604d518ad7b63f1ace7befe"
  end

  on_linux do
    url "https://github.com/dawidd6/action-homebrew-bump-formula/archive/v#{version}.tar.gz"
    sha256 "2c9581a0676ed34d150942de4d4ee329bf3243313604d518ad7b63f1ace7befe"
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

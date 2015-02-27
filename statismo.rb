require "formula"

class Statismo < Formula
  homepage "https://github.com/statismo/statismo"
  url "https://github.com/statismo/statismo/archive/v0.10.2.tar.gz"
  sha1 "c6f65bb7f37604aebbe40e767adbea4d39509050"
  head 'https://github.com/statismo/statismo.git'

  patch do
    url "https://gist.githubusercontent.com/sderaedt/5399baa012acc40f1c18/raw/74e382a87338ce706046f6313b069c07ae490a94/statismoCMakeFix"
    sha1 ""
  end

  depends_on "cmake" => :build
  depends_on "eigen" => :build
  depends_on "boost" => :build
  depends_on "hdf5" => :build
  depends_on "vtk" => :build
  depends_on "insighttoolkit" => :build

  def install
    args = std_cmake_args + %W[
      -DBUILD_SHARED_LIBS=ON
      -DBUILD_TESTING=ON
      -DVTK_SUPPORT=ON
      -DITK_SUPPORT=ON
    ]
    args << ".."

    mkdir 'statismo-build' do
      system "cmake", *args
      system "make", "install"
    end
  end
end

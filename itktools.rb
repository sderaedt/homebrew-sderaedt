require 'formula'

class Itktools < Formula
  homepage 'https://github.com/ITKTools/ITKTools'
  url 'https://github.com/ITKTools/ITKTools/archive/v0.3.0.tar.gz'
  sha256 ''
  head 'https://github.com/ITKTools/ITKTools.git'

  depends_on 'cmake' => :build
  depends_on 'insighttoolkit' => :build

  patch do
    # Add patch for output filename in create zero image
    url 'https://github.com/sderaedt/ITKTools/commit/64f51d85acab8a6cd7817b9e8beed5cd5418ad4d.patch'
  end

  def install
    args = std_cmake_args
    args.delete '-DCMAKE_BUILD_TYPE=None'
    args << '-DCMAKE_BUILD_TYPE=Release'
    args << "../src/"

    mkdir 'build' do
      system "cmake", "../src"
      system "cmake", *args
      system "make install"
    end
  end

  test do
    system "pxcalc \"1+1\""
  end
end

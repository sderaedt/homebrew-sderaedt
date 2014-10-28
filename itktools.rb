require 'formula'

class Itktools < Formula
  homepage 'https://github.com/ITKTools/ITKTools'
  url 'https://github.com/ITKTools/ITKTools/archive/v0.3.0.tar.gz'
  sha1 'bb53762aa093b8cebfbad256e9d333e998a0dd0f'
  head 'https://github.com/ITKTools/ITKTools.git'

  depends_on 'cmake' => :build
  depends_on 'insighttoolkit' => :build

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
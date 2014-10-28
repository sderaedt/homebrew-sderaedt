require 'formula'

class Elastix < Formula
  homepage 'https://github.com/ITKTools/ITKTools'
  url 'https://github.com/ITKTools/ITKTools/archive/v0.3.0.tar.gz'
  head 'https://github.com/ITKTools/ITKTools.git'

  depends_on 'cmake' => :build
  depends_on 'insighttoolkit' => :build

  def install
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
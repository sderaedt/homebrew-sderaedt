require 'formula'

class Rtk < Formula
  homepage 'http://openrtk.org'
  url 'https://github.com/SimonRit/RTK/archive/v1.2.0.tar.gz'
  sha1 ''
  head 'https://github.com/SimonRit/RTK.git'

  depends_on 'cmake' => :build
#  depends_on 'insighttoolkit' => :build

  def install
    args = std_cmake_args + %w[
      -DRTK_USE_CUDA=OFF
      -DRTK_USE_OPENCL=ON
    ]

    args.delete '-DCMAKE_BUILD_TYPE=None'
    args << '-DCMAKE_BUILD_TYPE=Release'

    mkdir 'build' do
      system "cmake", "..", *args
      system "make install"
    end
  end

  test do
    system "rtkfdk"
  end
end

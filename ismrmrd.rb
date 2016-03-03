require 'formula'

class Ismrmrd < Formula
  homepage 'http://ismrmrd.github.io/'
  url 'https://github.com/ismrmrd/ismrmrd/archive/v1.3.2.tar.gz'
  version '1.3.2'
  head 'https://github.com/ismrmrd/ismrmrd.git'
  
  depends_on 'cmake' => :build
  depends_on 'wget'
  depends_on 'hdf5'
  depends_on 'boost'
  depends_on 'fftw'
  
  def install
    args = std_cmake_args
    args << "-DCMAKE_BUILD_TYPE=Release"
    
    mkdir 'build' do
      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
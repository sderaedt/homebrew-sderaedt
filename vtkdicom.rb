require 'formula'

class Vtkdicom < Formula
  homepage 'http://dgobbi.github.io/vtk-dicom/'
  url 'https://github.com/dgobbi/vtk-dicom/archive/v0.6.6.tar.gz'
  sha1 '5b95396c197cdf4f9163080fa72ef5c36a31f807'
  
  head 'git://github.com/dgobbi/vtk-dicom.git'

  depends_on 'cmake' => :build
  depends_on 'vtk'
  
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

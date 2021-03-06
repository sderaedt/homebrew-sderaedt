require 'formula'

class Vtkdicom < Formula
  homepage 'http://dgobbi.github.io/vtk-dicom/'
  url 'https://github.com/dgobbi/vtk-dicom/archive/v0.6.7.tar.gz'
  sha256 ''
  
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

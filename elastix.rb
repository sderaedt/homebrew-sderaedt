require 'formula'

class Elastix < Formula
  homepage 'http://elastix.isi.uu.nl'
  url 'http://elastix.isi.uu.nl/download/elastix_sources_v4.7.tar.bz2'
  sha1 '54e7acc4a9287f1517356f8ef4da70a15439ab93'
  head 'https://github.com/mstaring/elastix.git'

  depends_on 'cmake' => :build
  depends_on 'insighttoolkit' => :build
  depends_on 'libtiff' => :build

  def install
    args = std_cmake_args + %w[
      -DUSE_SimilarityTransformElastix=ON
      -DUSE_AdvancedKappaStatisticMetric=ON
      -DUSE_WeightedCombinationTransformElastix=ON
      -DUSE_DisplacementMagnitudePenalty=ON
    ]

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
    system "elastix"
  end
end

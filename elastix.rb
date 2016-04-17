require 'formula'

class Elastix < Formula
  homepage 'http://elastix.isi.uu.nl'
  url 'http://elastix.isi.uu.nl/download/elastix_sources_v4.8.tar.bz2'
  sha256 '9ec2bec426e8a249150fdf5af3a69037355ccb7b2c2d937bbfb7f0c563b6e81d'
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
      -DUSE_NormalizedGradientCorrelationMetric=ON
      -DUSE_RayCastResampleInterpolator=ON
      -DUSE_RayCastInterpolator=ON
      -DUSE_PatternIntensityMetric=ON
      -DUSE_GradientDifferenceMetric=ON
      -DUSE_Simplex=ON
    ]

    args.delete '-DCMAKE_BUILD_TYPE=None'
    args << '-DCMAKE_BUILD_TYPE=Release'
    args << "../src/"

    mkdir 'build' do
      system "cmake", "../src"
      system "cmake", *args
      interactive_shell
      system "make install"
    end
  end

  test do
    system "elastix"
  end
end

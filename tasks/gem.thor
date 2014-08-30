$:.unshift File.expand_path("../../lib", __FILE__)

require 'rubedo/reflection/version'

class Default < Thor
  desc 'build', "Build rubedo-reflection-#{Rubedo::Reflection::VERSION::String}.gem into the pkg directory"
  def build
    Bundler::GemHelper.new.build_gem
  end

  desc 'install', "Build and install rubedo-reflection-#{Rubedo::Reflection::VERSION::String}.gem into system gems"
  def install
    helper = Bundler::GemHelper.new
    helper.install_gem(helper.build_gem)
  end

  desc 'release', "Create tag v#{Rubedo::Reflection::VERSION::String} and build and push rubedo-reflection-#{Rubedo::Reflection::VERSION::String}.gem to Rubygems"
  def release
    helper = Bundler::GemHelper.new
    helper.release_gem(helper.build_gem)
  end
end

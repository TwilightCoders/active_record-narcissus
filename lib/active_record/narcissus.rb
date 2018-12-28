require "active_record/narcissus/version"

require 'active_support/all'

# require 'active_record/narcissus/config'
require 'active_record/narcissus/reflection'
require 'active_record/narcissus/railtie' if defined?(Rails::Railtie)

module ActiveRecord
  module Narcissus

    class << self
      attr_writer :logger

      def logger
        @logger ||= Logger.new($stdout).tap do |log|
          log.progname = self.name
          log.level = Logger::INFO
        end
      end
    end

    def self.root
      @root ||= Pathname.new(File.expand_path('../../', File.dirname(__FILE__)))
    end

  end
end

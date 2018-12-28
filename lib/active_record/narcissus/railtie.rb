require 'rails/railtie'

module ActiveRecord
  module Narcissus
    class Railtie < Rails::Railtie
      initializer 'active_record-narcissus.load' do |_app|
        ActiveRecord::Narcissus.logger.debug "active_record-narcissus.load"
        ActiveSupport.on_load(:active_record) do
          ::ActiveRecord::Reflection::AssociationReflection.prepend Reflection
          ::ActiveRecord::Reflection::ThroughReflection.prepend ThroughReflection
        end
      end
    end
  end
end


module ActiveRecord
  module Narcissus
    module Reflection

      def klass=(new_klass)
        @klass = new_klass
      end

    end
  end
end

module ActiveRecord
  module Narcissus
    module ThroughReflection

      def initialize(delegate_reflection)
        super
        delegate_reflection.klass = @klass
      end

      def through_klass
        through = delegate_reflection.options[:through]
        delegate_reflection.active_record.reflect_on_association(through).klass
      end

      def klass
        @klass ||= through_klass.const_get(class_name)
      rescue NameError
        super
      end

    end
  end
end

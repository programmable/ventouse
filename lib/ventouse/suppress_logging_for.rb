module ActionController
  class Base
    def self.suppress_logging_for *actions
      unless respond_to? :actions_without_logging
        cattr_accessor :actions_without_logging

        self.actions_without_logging = []

        define_method :process do |request, *args|
          if self.class.actions_without_logging.include?((request['action'] || 'index').to_sym)
            logger.silence { super }
          else
            super
          end
        end
      end
      self.actions_without_logging.concat actions.flatten
    end
  end
end

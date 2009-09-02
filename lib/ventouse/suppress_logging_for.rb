module SuppressLoggingFor
  def self.suppress_logging_for *actions
    unless defined? @@actions_without_logging
      @@actions_without_logging = []

      def process(request, *)
        if @@actions_without_logging.include?((request['action'] || 'index').to_sym)
          logger.silence { super }
        else
          super
        end
      end
    end
    @@actions_without_logging.concat actions.flatten
  end
end

ActionController::Base.send :include, SuppressLoggingFor

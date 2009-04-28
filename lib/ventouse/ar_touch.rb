module ActiveRecord
  module Timestamp
    unless method_defined? :touch
      # Saves the record with the updated_at/on attributes set to the current time.
      # If the save fails because of validation errors, an ActiveRecord::RecordInvalid exception is raised.
      # If an attribute name is passed, that attribute is used for the touch instead of the updated_at/on attributes.
      #
      # Examples:
      #
      # product.touch # updates updated_at
      # product.touch(:designed_at) # updates the designed_at attribute
      def touch(attribute = nil)
        current_time = current_time_from_proper_timezone

        if attribute
          write_attribute(attribute, current_time)
        else
          write_attribute('updated_at', current_time) if respond_to?(:updated_at)
          write_attribute('updated_on', current_time) if respond_to?(:updated_on)
        end

        save!
      end
    end

    unless method_defined? :current_time_from_proper_timezone
      def current_time_from_proper_timezone
        self.class.default_timezone == :utc ? Time.now.utc : Time.now
      end
    end
  end
end
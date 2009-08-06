class Module
  #  Usage:
  #
  #  class Model
  #    module ModelAspect
  #      declarations do
  #        has_many :aspect_details
  #        validates_presence_of :main_aspect
  #        etc
  #      end
  #    end
  #  end
  def declarations &blk
    class << self
      unless defined? declaration_blocks
        attr_accessor :declaration_blocks

        def included(mod)
          case mod
            when Class
              declaration_blocks.each {|b| mod.class_eval &b }
            when Module
              declaration_blocks.each {|b| mod.declarations &b }
          end
        rescue Exception => ex # When autoloading, you never see real exception unless this rescue
          puts ex.message
          puts ex.backtrace.join("\n")
          raise ex
        end
      end
    end
    
    (self.declaration_blocks ||= []) << blk
  end
end
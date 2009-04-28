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
    raise "There should be only one declarations block" if defined? declarations_block

    class << self
      attr_accessor :declarations_block

      def included(mod)
        mod.class_eval(&declarations_block) unless declarations_block.nil?
      rescue Exception => ex # When autoloading, you never see real exception unless this rescue
        puts ex.message
        puts ex.backtrace.join("\n")
        raise ex
      end
    end
    self.declarations_block = blk
  end
end
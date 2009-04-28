require 'timeout'

module RescueExt
  def rescue_all default = nil, silent = false
    begin
      return yield
    rescue Exception => e
      unless silent
        Rails.logger.warn "Exception rescued:"
        Rails.logger.warn e
        if e.respond_to? :io
          Rails.logger.warn "URI: '#{e.io.meta['location']}'"
        end
        Rails.logger.warn e.backtrace.join("\n")
      end

      return default
    end
  end

  def silently_rescue_all default = nil, &block
    rescue_all default, true, &block
  end
  
  def timeout sec, default = nil
    rescue_all(default) {Timeout.timeout(sec) { yield }}
  end
end

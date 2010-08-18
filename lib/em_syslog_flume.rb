require File.join(File.dirname(__FILE__), 'em_syslog')

module EventMachine
  module Protocols
    class SyslogFlume < Syslog
      # Log a message with the given severity, tag and time
      # 
      # == Options:
      # * message   -- the message you want to log
      # * severity  -- see +SEVERITIES+
      # * tag       -- the messages tag
      # * time      -- a Time object
      #
      def log(message, severity = :info, tag = '', time = nil)
        severity = SEVERITIES[severity] if severity.is_a? Symbol

        send_data "<#{0 * 8 + severity}>#{message}\n"
      end
    end
  end
end
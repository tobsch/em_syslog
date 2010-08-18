require 'eventmachine'
require 'socket'

module EventMachine
  module Protocols
    class Syslog < Connection

      VERSION = '1.0.0'
      
      SEVERITIES = {
        :emergency => 0,      # system is unusable
        :alert => 1,          # action must be taken immediately
        :critical => 2,       # critical conditions
        :error => 3,          # error conditions
        :warning => 4,        # warning conditions
        :notice => 5,         # normal but significant condition
        :informational => 6,  # informational messages
        :info => 6,           # informational messages (short name for the previous)
        :debug => 7           # debug-level messages
      }
      
      # this is called after connection initialization
      #
      def post_init
        puts 'Syslogger initialized'
      end
      
      # Log a message with the given severity, tag and time
      # 
      # == Options:
      # * message   -- the message you want to log
      # * severity  -- see +SEVERITIES+
      # * tag       -- the messages tag
      # * time      -- a Time object
      #
      def log(message, severity = :info, tag = '', time = nil)
        time ||= Time.now
        hostname = 'localhost'
        day = time.strftime('%b %d').sub(/0(\d)/, ' \\1')
        severity = SEVERITIES[severity] if severity.is_a? Symbol

        send_data "<#{0 * 8 + severity}>#{day} #{time.strftime('%T')} #{hostname} #{tag}: #{message}\n"
      end

      # Start to close the connection
      # finishes writing before closing
      #
      def start_closing
        close_connection_after_writing
      end
    end
  end
end
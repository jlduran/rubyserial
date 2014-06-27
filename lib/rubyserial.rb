$:.unshift(File.dirname(__FILE__))
require 'rbconfig'
require 'ffi'
include RbConfig

module RubySerial
  class Exception < Exception
  end
end

if CONFIG['host_os'] =~ /mswin|windows/i
  require 'rubyserial/windows'
else
  if CONFIG['host_os'] =~ /linux/i
    require 'rubyserial/linux_constants'
  else
    require 'rubyserial/osx_constants'
  end
  require 'rubyserial/posix'
end
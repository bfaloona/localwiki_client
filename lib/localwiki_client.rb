$LOAD_PATH.unshift(File.dirname(__FILE__)) unless
    $LOAD_PATH.include?(File.dirname(__FILE__)) || $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

require 'localwiki/resource'
require 'localwiki/client'
require 'localwiki/version'

# convenience class
class LocalwikiClient < Localwiki::Client; end

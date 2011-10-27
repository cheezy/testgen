$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'bin'))

require 'aruba/cucumber'

require 'testgen'
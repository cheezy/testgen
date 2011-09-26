require 'fileutils'

After do
  dir = File.join(File.dirname(__FILE__), '../../', 'tmp/aruba/sample')
  FileUtils.rm_rf dir
end
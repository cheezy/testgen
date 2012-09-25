# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'cucumber', :notification => true, :all_after_pass => true, :cli => '--profile focus' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
  watch(%r{^lib/.+\.rb$})                   { "features" }
  watch(%r{^lib/.+\.tt$})                   { "features" }
  watch(%r{^cucumber.yml$})                 { "features" }
end

task "default" => "spec"
task "test" => "spec"

desc "Run tests"
task "spec" do
  sh "rspec"
end

desc "Clean up"
task "clean" do
  sh "trash hash-polyfill-*.gem"
end

desc "Build gem"
task "gem:build" do
  sh "gem build hash-polyfill.gemspec"
end

desc "Upload gem"
task "gem:push" => "gem:build" do
  gem_file = Dir["hash-polyfill-*.gem"][-1] or raise "No gem found"
  sh "gem", "push", gem_file
end

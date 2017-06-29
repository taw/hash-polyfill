task "default" => "spec"
task "test" => "spec"

desc "Run tests"
task "spec" do
  system "rspec"
end

desc "Clean up"
task "clean" do
  system "trash hash-polyfill-*.gem"
end

desc "Build gem"
task "gem:build" do
  system "gem build hash-polyfill.gemspec"
end

desc "Upload gem"
task "gem:push" => "gem:build" do
  gem_file = Dir["hash-polyfill-*.gem"][-1] or raise "No gem found"
  system "gem", "push", gem_file
end
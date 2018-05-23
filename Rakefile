task default: %w[test]

DESTINATION = 'platform=iOS Simulator,name=iPhone X'
PROJECT = 'iCards'


desc "swiftlint autocorrect"
task :lint do
  puts ">> swiftlint autocorrect"
  sh "swiftlint autocorrect"
end

desc "Update Dependencies [Cocoapods]"
task :update do
  puts ">> pod update"
  sh "pod update --verbose"
end

desc "Build"
task :buid do
  puts ">> xcodebuild build"
  sh "cd #{PROJECT}; codebuild -workspace #{PROJECT}.xcworkspace -scheme #{PROJECT} -destination \"#{DESTINATION}\" build | xcpretty"
end

desc "Test"
task :test do 
  puts ">> xcodebuild build"
  sh "cd #{PROJECT}; codebuild -workspace #{PROJECT}.xcworkspace -scheme #{PROJECT} -destination \"#{DESTINATION}\" test | xcpretty"
end

desc "Open workspace"
task :open do
  sh "open #{PROJECT}.xcworkspace"
end

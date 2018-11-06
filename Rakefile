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

desc "Update README.md"
task :readme do
  ruby 'scripts/update_readme.rb'
  ruby 'scripts/update_models.rb'
end


desc "New note"
task :tong, [:new_file_name] do |task, args|
  name = args[:new_file_name]
  ruby "./scripts/create_note.rb tong #{name}"
end

desc "Push git"
task :push => [:readme] do
  sh "git add ."
  sh "git commit -m '[*]more notes'"
  sh "git push origin master"
end

desc "image base path"
task :imagebase do
  puts "https://raw.githubusercontent.com/TongCui/icards/master/notebooks/tong/images/<image>"
end

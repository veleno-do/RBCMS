files = Dir.glob('**/*')
methods = []
files.each do |file|
    methods.push(file) if file.include?('.rb') && file != "rbcms-daemon.rb" && file != "root/rbcms/autoloader.rb"
end
methods.each { | method |
    load "#{ENV['HOME']}/#{method}"
}

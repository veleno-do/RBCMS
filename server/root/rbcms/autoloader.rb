# load "#{ENV['HOME']}/root/rbcms/logger/SysLogger.rb"
files = Dir.glob('**/*')
methods = []
files.each do |file|
    methods.push(file) if file.include?('.rb') && file != "rbcms-daemon.rb" && file != "root/rbcms/autoloader.rb"
end
# SysLogger.loadfile methods.to_s
methods.each {|method|
    # SysLogger.loadfile method.to_s
    load "#{ENV['HOME']}/#{method}"
}

require 'open3'
require 'rubygems'
require 'bundler'
Bundler.require

set :root, File.dirname(__FILE__)
set :bind, '0.0.0.0'

get '/' do
  erb :epubchecker
end

post '/validate_epub' do
  @epubcheck_success = nil
  @epubcheck_log_output = nil
  @epub_temp_file = File.absolute_path("uploads/epub_#{Time.now.to_i}_#{rand(1000)}.epub")
  File.open(@epub_temp_file, "w") do |f|
    f.write(params['epub_upload'][:tempfile].read)
  end
  Open3.popen3("java", "-jar", "epubcheck-3.0.1/epubcheck-3.0.1.jar", @epub_temp_file) do |stdin, stdout, stderr, wait_thr|
      @epubcheck_success = wait_thr.value.success?
      @epubcheck_log_output = stderr.read
    end
    puts @epubcheck_success
    puts @epubcheck_log_output
    erb :epubchecker
end

after '/validate_epub' do
  File.delete(@epub_temp_file) if File.exist?(@epub_temp_file)
end
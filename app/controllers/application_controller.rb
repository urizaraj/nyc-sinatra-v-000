class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    haml :index
  end
end

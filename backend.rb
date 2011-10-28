class Backend < Sinatra::Base

  configure :production do
    set :root, File.dirname(__FILE__)
  end

  get '/' do
    erb :index
  end
end

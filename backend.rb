class Backend < Sinatra::Base

  configure :production do
    set :root, File.dirname(__FILE__)
  end

  get '/' do
    'Hello world'
  end
end

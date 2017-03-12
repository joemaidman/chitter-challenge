class Chitter < Sinatra::Base

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  post '/tags' do
    if params[:tag] != ""
      redirect('/tags/' + params[:tag])
    else
      redirect '/peeps'
    end
  end

end
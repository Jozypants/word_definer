require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @words = Word.all
  erb(:homepage)
end

get('/homepage') do
  @words = Word.all
  erb(:homepage)
end

get('/homepage/new') do
  erb(:new_word)
end

post('/homepage') do 
  name = params[:word_new]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:homepage)
end

patch('/homepage/:id') do
  @word = Album.find(params[:id].to_i())
  @albums = Album.all
  if params[:buy]
    @album.sold()
  else  
    @album.update(params[:name])
  end
  erb(:albums)
end

# delete('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @album.delete()
#   redirect to('/albums')
# end
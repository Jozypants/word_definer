require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @word = Word.all
  erb(:homepage)
end

get('/homepage') do
  @words =Word.all
end

post('/homepage') do ## Adds album to list of albums, cannot access in URL bar
  word = params[:new_word]
  word = Word.new(word, nil)
  word.save()
  erb(:homepage)
end

# patch('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @albums = Album.all
#   if params[:buy]
#     @album.sold()
#   else  
#     @album.update(params[:name])
#   end
#   erb(:albums)
# end

# delete('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @album.delete()
#   redirect to('/albums')
# end
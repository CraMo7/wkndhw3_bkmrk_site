require("sinatra")
require("sinatra/contrib/all") if development?
require("./models/bkmrk.rb")

# => REDIRECTS
get("/") {redirect to("/bkmrk")}
get("/bkmrk/") {redirect to("/bkmrk")}
get("/bkmrks/") {redirect to("/bkmrks")}
get("/bkmrks/new/") {redirect to("/bkmrks/new")}
get("/bkmrks/:id/") {redirect to("/bkmrks/:id")}
get("/bkmrks/:id/edit/") {redirect to("/bkmrks/:id/edit")}

# => HOMEPAGE
get("/bkmrk") do
  erb(:layout_bkmrk) {erb(:bkmrk_home)}
end

# => INDEX - 1 - GET
get("/bkmrks") do
  @bkmrks_all = Bkmrk.index
  erb(:layout_bkmrk) {erb(:bkmrk_index)} 
end

# => NEW - 2 - GET form
get("/bkmrks/new") do
  erb(:layout_bkmrk) {erb(:bkmrk_new)}
end

# => CREATE - 3 - POST
post("/bkmrks") do
  @bkmrk = Bkmrk.new(params)
  @bkmrk.save()
  erb(:layout_bkmrk) {erb(:bkmrk_create)}
end

# => SHOW - 4 - GET
get("/bkmrks/:id") do
  @bkmrk = Bkmrk.find(:id)
  erb(:layout_bkmrk) {erb(:bkmrk_show)}
end  

# => EDIT - 5 - GET form
get("/bkmrks/:id/edit") do

  erb(:layout_bkmrk) {erb(:bkmrk_edit)}
end

# => UPDATE - 6 - PUT (POST)
post("/bkmrks/:id") do
  erb(:layout_bkmrk) {erb(:bkmrk_update)}
end

# => DESTROY - 7 - DELETE (POST)
post("/bkmrks/:id/delete") do

  erb(:layout_bkmrk) {erb(:bkmrk_destroy)}
end
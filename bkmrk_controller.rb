require("sinatra")
require("sinatra-contrib/all") if development?

get("/") {redirect to("/bkmrk")}

get("/bkmrk/") {redirect to("/bkmrk")}

get("/bkmrk") do
  erb(:bkmrk_index)
end
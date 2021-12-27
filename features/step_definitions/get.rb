Given('I have the posts endpoint') do
    $base_uri = "https://jsonplaceholder.typicode.com"
    $path = "/posts"
  end
  
  When('I make a GET request') do
    @response = HTTParty.get $base_uri + $path
  end
  
  Then('should respond with a list of posts') do
    #puts @response
    expect(@response).to match_json_schema('get_all_posts')
  end
  
  Then('status code {string}') do |status_code|
    status_code = status_code.to_i
    expect(@response.code).to eq(status_code)
  end
  
  When('I make a GET request with id {string}') do |posts_id|
    @response = HTTParty.get $base_uri + $path + "/" + posts_id
  end
  
  Then('should respond with a post') do
    #puts @response
    expect(@response).to include('userId', 'id', 'title', 'body')
    expect(@response).to match_json_schema("get_a_post")
  end
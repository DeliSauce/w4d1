require 'addressable/uri'
require 'rest-client'

def create_user(name, email)

  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

    puts RestClient.post(
      url,
      { user: { name: name, email: email} }
    )

end

begin
  create_user("Gizmo")
rescue StandardError => e
  puts e
  puts "You didn't include something."
end
# create_user("Gizmo", "gizmo@gizmo.giz")

# def index_users
#     url = Addressable::URI.new(
#       scheme: 'http',
#       host: 'localhost',
#       port: 3000,
#       path: '/users/1.json',
#       query_values: {
#       'some_category[a_key]' => 'another value',
#       'some_category[a_second_key]' => 'yet another value',
#       'some_category[inner_inner_hash][key]' => 'value',
#       'something_else' => 'aaahhhhh'
#       }
#     ).to_s
#
#     puts RestClient.get(url)
# end
#
# index_users

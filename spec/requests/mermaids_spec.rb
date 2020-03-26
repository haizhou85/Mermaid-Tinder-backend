require 'rails_helper'

describe "Mermaids API", type: :request do
  it "gets a list of Mermaids" do
    # Create a new mermaid in the Test Database (not the same one as development)
    Mermaid.create(name: 'Felix', age: 2, enjoys: 'Walks in the park')

    # Make a request to the API
    get '/mermaids'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to have_http_status(:ok)

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates a mermaid" do
    # The params we are going to send with the request
    mermaid_params = {
      mermaid: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.'
      }
    }

    # Send the request to the server
    post '/mermaids', params: mermaid_params

    # Assure that we get a success back
    expect(response).to have_http_status(:ok)

    # Look up the cat we expect to be created in the Database
    new_mermaid = Mermaid.first

    # Assure that the created cat has the correct attributes
    expect(new_mermaid.name).to eq('Buster')
  end

  it "doesn't create a mermaid without a name" do
    mermaid_params = {
      mermaid: {
        age: 2,
        enjoys: 'Walks in the park'
      }
    }
  post '/mermaids', params: mermaid_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['name']).to include "can't be blank"
end

  it "doesn't create a mermaid without a enjoys" do
    mermaid_params = {
      mermaid: {
        name: "John",
        age: 6
      }
    }
  post '/mermaids', params: mermaid_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['enjoys']).to include "can't be blank"
  end

  it "doesn't create a mermaid without an age" do
    mermaid_params = {
      mermaid: {
        name: "Bryan",
        enjoys: 'Walks in the park'
      }
    }
  post '/mermaids', params: mermaid_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['age']).to include "can't be blank"
  end

  it "doesn't allow an enjoys less than 10 characters" do
    mermaid_params = {
      mermaid: {
        name: "Bryan",
        age: 34,
        enjoys: 'Walks'
      }
    }
    post '/mermaids', params: mermaid_params
    expect(response.status).to eq 422
  end

end

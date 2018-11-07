json.extract! user_input, :id, :num_of_columns, :csv, :created_at, :updated_at
json.url user_input_url(user_input, format: :json)

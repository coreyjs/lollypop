json.extract! recipe, :id, :name, :slug, :deleted, :active, :description, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)

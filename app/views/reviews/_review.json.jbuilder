json.extract! review, :id, :title, :introduction, :content, :platform, :rating_category, :created_at, :updated_at
json.url review_url(review, format: :json)

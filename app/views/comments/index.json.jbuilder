json.array!(@comments) do |comment|
  json.extract! comment, :id, :commenter, :body, :question_id
  json.url comment_url(comment, format: :json)
end

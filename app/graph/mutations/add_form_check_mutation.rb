AddFormCheckMutation = GraphQL::Relay::Mutation.define do
  name "AddFormCheck"
  input_field :title, !types.String
  input_field :description, !types.String
  input_field :videoUrl, !types.String
  input_field :mouvementId, !types.Int
  input_field :sportId, !types.Int
  input_field :visibility, !types.String

  return_field :rails_id, types.Int

  resolve -> (args, ctx) {
    fc = FormCheck.create(
      title: args[:title],
      description: args[:description],
      video_url: args[:videoUrl],
      sport_id: args[:sportId],
      user_id: ctx[:current_user].id
    )

    # Queue a job to get a thumbnail!
    ScreenshotJob.perform_later fc.id
    return {rails_id: fc.id}
  }
end

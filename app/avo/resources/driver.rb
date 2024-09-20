class Avo::Resources::Driver < Avo::BaseResource
  self.title = :username
  self.includes = [ :tasks, :client ]
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    # field :id, as: :id
    field :username, as: :text
    field :email, as: :text
    field :password, as: :password  # For creating new drivers
    field :password_confirmation, as: :password  # For confirmation
    field :client, as: :belongs_to, optional: true
    field :tasks, as: :has_many
    field :created_at, as: :date_time
    field :updated_at, as: :date_time
  end
end

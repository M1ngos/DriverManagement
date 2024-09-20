class Avo::Resources::Admin < Avo::BaseResource
  self.title = :email
  self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
  field :id, as: :id
  field :email, as: :text
  field :encrypted_password, as: :text, hide_on: :index
  field :reset_password_token, as: :text, hide_on: :index, optional: true
  field :reset_password_sent_at, as: :date_time, hide_on: :index, optional: true
  field :remember_created_at, as: :date_time, hide_on: :index, optional: true
  field :created_at, as: :date_time
  field :updated_at, as: :date_time
  end
end

class Avo::Resources::Client < Avo::BaseResource
  self.title = :name
  self.includes = [ :tasks, :drivers ]
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :contact_info, as: :text
    field :address, as: :text, optional: true
    field :tasks, as: :has_many
    field :drivers, as: :has_many
  end
end

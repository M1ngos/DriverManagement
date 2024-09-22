class Avo::Resources::Shift < Avo::BaseResource
  self.title = "Shift"
  self.includes = []
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :driver_id, as: :number
    field :clock_in, as: :date_time
    field :clock_out, as: :date_time
    field :driver, as: :belongs_to
    field :total_hours, as: :number, only_on: :show
    field :extra_pay, as: :number, only_on: :show
  end
end

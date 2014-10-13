class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :query, :field

  def execute!
    case self.field
    when "users"
      return User.where("username ILIKE '%#{self.query}%'")
    when "locations"
      return Location.where("name ILIKE '%#{self.query}%'")
    end
  end

  def persisted?
    false
  end
end
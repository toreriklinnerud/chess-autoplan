require "json"

class Datapot
  @datapot : Hash(String, JSON::Type)

  def initialize(plan_data : String)
    payload = String.from_json(plan_data, root: "d")
    parsed = JSON.parse(payload)
    data = JSON.parse(parsed["data"].as_s)
    @datapot = data["dataPot"].as_h
  end

  def current_usage
    @datapot["usedWithUnit"].to_s.sub(",", ".").sub("GB", "").to_f
  end

  def current_size
    @datapot["size"].as(Float64).to_i
  end
end

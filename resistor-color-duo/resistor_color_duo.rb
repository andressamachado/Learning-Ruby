class ResistorColorDuo 
  COLOR_SCHEMA = %w[black brown red orange yellow green blue violet grey white]

  def self.value(color_bands)
    resistance_value = ""
    color_bands.first(2).each{ |band| resistance_value << COLOR_SCHEMA.index(band).to_s}

    resistance_value.to_i
  end 
end
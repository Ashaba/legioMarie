class PopulateCuriaPraesidiaCount < ActiveRecord::Migration[7.0]
  def up
    Curia.find_each { |curia| Curia.reset_counters(curia.id, :praesidia) }
  end
end

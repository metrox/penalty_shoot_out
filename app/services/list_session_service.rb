class ListSessionService
  @@list = []

  def self.add(match)
    @@list << match
  end

  def self.last_id
    @@list.last.try(:id)
  end

  def self.update(match)
    index = @@list.index { |match| match[:id] == match.id }
    return false if index.blank?
    @@list[index] = match
    true
  end

  def self.list
    @@list
  end

  def self.find(id)
    @@list.bsearch { |match| match.id == id }
  end
end

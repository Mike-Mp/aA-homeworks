class Card
  attr_reader :value, :visible

  def initialize(value)
    @value = value
    @visible = false
  end

  def to_s
    return ">>#{@value}" if @visible
    return "X(#{@value})" if !@visible
  end

  def hide
    @visible = false
  end

  def reveal
    @visible = true
  end

  def ==(card)
    @value == card.value
  end

end
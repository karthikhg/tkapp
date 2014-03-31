module HomeHelper

  def red_or_green value_str
    value_str.to_d < 0 ? "loss" : "gain"
  end

  def total_gain_loss holdings
    total_gl = 0
    holdings.each do |holding|
      total_gl += holding["gainloss"].to_d
    end
    number_with_precision(total_gl, precision: 2)
  end

  def total_cost_basis holdings
    total_cost = 0
    holdings.each do |holding|
      total_cost += holding["costbasis"].to_d
    end
    number_with_precision(total_cost, precision: 2)
  end

  def total_market_value holdings
    total_value = 0
    holdings.each do |holding|
      total_value += holding["marketvalue"].to_d
    end
    number_with_precision(total_value, precision: 2)
  end

end

class Hash
  def compact
    reject do |key, value|
      value.nil?
    end
  end unless method_defined? :compact

  def compact!
    reject! do |key, value|
      value.nil?
    end
  end unless method_defined? :compact!

  def select_values
    return enum_for(:select_values) unless block_given?
    select do |key, value|
      yield(value)
    end
  end unless method_defined? :select_values

  def select_values!
    return enum_for(:select_values!) unless block_given?
    select! do |key, value|
      yield(value)
    end
  end unless method_defined? :select_values!

  def reject_values
    return enum_for(:reject_values) unless block_given?
    reject do |key, value|
      yield(value)
    end
  end unless method_defined? :reject_values

  def reject_values!
    return enum_for(:reject_values!) unless block_given?
    reject! do |key, value|
      yield(value)
    end
  end unless method_defined? :reject_values!

  def transform_values
    return enum_for(:transform_values) unless block_given?
    result = {}
    each do |key, value|
      result[key] = yield(value)
    end
    result
  end unless method_defined? :transform_values

  def transform_values!
    return enum_for(:transform_values!) unless block_given?
    each do |key, value|
      self[key] = yield(value)
    end
    self
  end unless method_defined? :transform_values!
end

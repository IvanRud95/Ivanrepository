class ValidError < RuntimeError

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
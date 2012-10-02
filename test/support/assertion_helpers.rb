module AssertionHelpers
  # Object must be a lambda or "callable object"
  def assert_change(object)
    old = object.call
    yield
    refute_equal old, object.call, 'Object should have changed, but did not'
  end

  def refute_change(object)
    old = object.call
    yield
    assert_equal old, object.call, 'Object should not have changed, but did'
  end
end

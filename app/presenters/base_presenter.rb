class BasePresenter < SimpleDelegator

  def self.from_collection(objects)
    objects.map { |obj| new(obj) }
  end

  def class
    object.class
  end

  private

  def object
    __getobj__
  end
end

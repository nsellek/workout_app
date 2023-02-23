class BasePresenter < SimpleDelegator

  def self.from_collection(objects)
    objects.map { |obj| new(obj) }
  end

  private

  def object
    __getobj__
  end
end

class IndexDecorator
  def initialize(klass, eager_load, controller)
    @klass = klass
    @records = klass.eager_load(eager_load).accessible_by(controller.current_ability).filter(controller.filtering_params).sort(controller.params[:sort] || {}).paginate(page: controller.params[:page] || 1)
    @count = klass.eager_load(eager_load).accessible_by(controller.current_ability).filter(controller.filtering_params).count
  end

  def as_json(options={})
    {
        @klass.model_name.plural => @records.as_json(options),
        :max_entries => @count,
        :entries_per_page => @klass.per_page
    }
  end
end
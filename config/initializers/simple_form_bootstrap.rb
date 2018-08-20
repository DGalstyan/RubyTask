# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn'
  config.boolean_label_class = nil
  config.boolean_style = :nested
  config.item_wrapper_tag = :div
  config.wrappers :task, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.use :label, class: ['control-label']
    b.wrapper tag: 'div' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :hint, wrap_with: {tag: 'span', class: 'help-block'}
    end
    b.use :error, wrap_with: {tag: 'span', class: 'help-inline'}
  end
  config.input_mappings = {/date_select/ => :date_select}
  config.default_wrapper = :task
end

class TodoItem
    include Listable
    attr_reader :description, :due, :priority

    def initialize(description, options={})
        @description = description
        @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
        @priority = options[:priority]
    end
    def details
        details = format_description(@description) + "due: "
        details << format_date(@due) if @due
        details << "No Due Date" unless @due
        details << format_priority(@priority)
        details
    end
end

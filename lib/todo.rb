class TodoItem
    include Listable
    attr_reader :description, :due, :priority, :item_type

    def initialize(description, type, options={})
        @description = description
        @item_type = type
        @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
        @priority = options[:priority]
    end
    def details
        details = format_description(@description)
        details << format_type(@item_type)
        details << "due: " + format_date(@due) if @due
        details << "No Due Date" unless @due
        details << format_priority(@priority)
        details
    end
    def update_priority(new_priority)
        @priority = new_priority if new_priority =~ /\A(?:low|medium|high|)\z/
    end
end

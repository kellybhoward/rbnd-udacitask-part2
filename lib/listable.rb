module Listable
    # Listable methods go here
    def format_description(description)
        "#{description}".ljust(30)
    end
    def format_date(*d)
        dates = d[0].strftime("%D") if d[0]
        dates << " -- " + d[1].strftime("%D") if d[1]
        dates = "" if !dates
        return dates
    end
    def format_priority(priority)
        value = " ⇧" if priority == "high"
        value = " ⇨" if priority == "medium"
        value = " ⇩" if priority == "low"
        value = "" if !priority
        return value
    end
end

module Listable
    # Listable methods go here
    def format_description(description)
        Rainbow("#{description}".ljust(30)).green
    end
    def format_date(*d)
        dates = d[0].strftime("%D") if d[0]
        dates << " -- " + d[1].strftime("%D") if d[1]
        dates = "" if !dates
        return dates
    end
    def format_priority(priority)
        value = " ⇧".colorize(:red) if priority == "high"
        value = " ⇨".colorize(:yellow) if priority == "medium"
        value = " ⇩".colorize(:green) if priority == "low"
        value = "" if !priority
        return value
    end
end

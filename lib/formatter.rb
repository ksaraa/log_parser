# frozen_string_literal: true

class Formatter
  def call(analysis:)
    title = analysis.title
    display_title(title)
    display_body(analysis.log_entries, title)
  end

  private

  def display_title(title)
    puts "*** #{title.capitalize} ***"
  end

  def display_body(log_entries, title)
    log_entries.each { |log_entry| display_log_entry(log_entry, title) }
    puts("\n")
  end

  def display_log_entry(log_entry, title)
    puts "#{log_entry.path} #{log_entry.visitor_counter} #{title}"
  end
end

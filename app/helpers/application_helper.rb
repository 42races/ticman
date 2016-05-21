module ApplicationHelper
  def display(tic)
    attr = tic.attributes
    attr.delete("_id")
    output = attr.to_a.map do |item|
      "<span class='tic-left'>#{item.first}</span> = <span clss='tic-right'>#{item.last}</span>"
    end.join(" ")

    "<div class='tic'>#{output}</div>".html_safe
  end
end

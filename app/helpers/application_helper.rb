module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end

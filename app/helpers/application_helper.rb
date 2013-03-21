# This is the application helper, these methods are available in the view
# and are typically used for formatting output

module ApplicationHelper
  # A helper to set the <title> element when called within a view
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  # A helper to create a <div> element that conditionally has its display
  # set to none, in this case, the element is hidden to begin with
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end

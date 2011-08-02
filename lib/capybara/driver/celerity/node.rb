class Capybara::Driver::Celerity::Node < Capybara::Driver::Node
  def text
    native.text
  end

  def [](name)
    value = native.attribute_value(name.to_sym)
    return value if value and not value.to_s.empty?
  end

  def value
    if tag_name == "select" and native.multiple?
      find(".//option[@selected]").map { |n| if n.has_value? then n.value else n.text end }
    else
      native.value
    end
  end

  def set(value)
    native.set(value)
  end

  def select_option
    native.click
  end

  def unselect_option
    unless select_node.native.multiple?
      raise Capybara::UnselectNotAllowed, "Cannot unselect option from single select box."
    end

    # FIXME: couldn't find a clean way to unselect, so clear and reselect
    selected_nodes = select_node.find('.//option[@selected]')
    select_node.native.clear
    selected_nodes.each { |n| n.click unless n.path == path }
  end

  def click
    native.click
  end

  def drag_to(element)
    native.fire_event('mousedown')
    element.native.fire_event('mousemove')
    element.native.fire_event('mouseup')
  end

  def tag_name
    # FIXME: this might be the dumbest way ever of getting the tag name
    # there has to be something better...
    native.to_xml[/^\s*<([a-z0-9\-\:]+)/, 1]
  end

  def visible?
    native.visible?
  end

  def checked?
    native.checked?
  rescue # https://github.com/langalex/culerity/issues/issue/33
    false
  end

  def selected?
    native.selected?
  rescue # https://github.com/langalex/culerity/issues/issue/33
    false
  end

  def path
    native.xpath
  end

  def trigger(event)
    native.fire_event(event.to_s)
  end

  def find(locator)
    noko_node = Nokogiri::HTML(driver.body).xpath(native.xpath).first
    all_nodes = noko_node.xpath(locator).map { |n| n.path }.join(' | ')
    if all_nodes.empty? then [] else driver.find(all_nodes) end
  end

protected

  # a reference to the select node if this is an option node
  def select_node
    find('./ancestor::select').first
  end

  def has_value?
    native.object.hasAttribute('value')
  end
end

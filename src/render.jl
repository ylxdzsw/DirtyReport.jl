function render(buffer, this::Section)
    if this.layout == "auto"
        layout = auto_layout(this)
    else
        layout = Tokenizer(this.layout) |> parse_layout
    end

    render(buffer, this, layout)
end

function render(buffer, this, Row)
end

function render(buffer, this, Col)

end

function render(buffer, this, Element)

end

function auto_layout(this::Section)
    error("TODO")
end

function get_width_hint(x::Row)
    sum(get_width_hint.(x.children)) + length(x.children) - 1
end

function get_width_hint(x::Col)
    maximum(get_width_hint.(x.children))
end

function get_width_hint(x::Element)

end

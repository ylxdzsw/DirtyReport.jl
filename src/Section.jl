type _section_dataset{T}
    this::T
end

function (_this::_section_dataset)(x::Int)
    0 <= x <= 9 || throw(ArgumentError("dataset number should be within 0 - 9"))

    while length(_this.this.datasets) < x+1
        push!(_this.this.datasets, DataSet())
    end

    _this.this.current_dataset = _this.this.datasets[x+1]
    _this.this
end

type _section_setlayout{T}
    this::T
end

function (_this::_section_setlayout)(layout::String)
    _this.this.layout = layout
end

type Section
    layout::String
    datasets::Vector{DataSet}

    current_dataset::DataSet

    dataset::_section_dataset{Section}

    Section() = begin
        this = new()

        this.layout = "auto"
        this.datasets = [DataSet()]
        this.current_dataset = this.datasets[1]

        this.dataset = _section_dataset{Section}(this)

        this
    end
end

type Template{T<:Function}
    width::Int
    render::T
end

Template{T}(w, f::T) = Template{T}(w, f)

const templates = Dict(
    :text => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :list => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :title => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :scatter => Template(10, function(buf, data::DataSet)
        id = uid()
        println(buffer, """<div id="scatter_$id" style="width:100%;height:100%;"></div>""")
        println(buffer, """<script>echarts.init(document.getElementById('plot')).setOption(""")
        @json buffer """

        """
        println(buffer, """)</script>""")
    end),

    :line => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :pie => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :bar => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :box => Template(10, function(buf, data::DataSet)
        error("TODO")
    end),

    :heat => Template(10, function(buf, data::DataSet)
        error("TODO")
    end)
)

